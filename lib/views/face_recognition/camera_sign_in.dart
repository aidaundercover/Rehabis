import 'package:camera/camera.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/main.dart';
import 'package:rehabis/utils/local_db.dart';
import 'package:rehabis/views/auth/sign_up.dart';
import 'package:rehabis/views/first_view/select_your_weak.dart';
import 'package:rehabis/views/main/home.dart';
import '../../models/user.dart';
import '../../widgets/common_widgets.dart';
import 'ml_service.dart';

class FaceScanScreenSignIn extends StatefulWidget {
  final UserRehabis user;

  const FaceScanScreenSignIn({Key? key, required this.user}) : super(key: key);

  @override
  _FaceScanScreenSignInState createState() => _FaceScanScreenSignInState();
}

class _FaceScanScreenSignInState extends State<FaceScanScreenSignIn> {
  late CameraController _cameraController;
  bool flash = false;
  bool isControllerInitialized = false;
  late FaceDetector _faceDetector;
  final MLService _mlService = MLService();
  List<Face> facesDetected = [];

  Future initializeCamera() async {
    await _cameraController.initialize();
    isControllerInitialized = true;
    _cameraController.setFlashMode(FlashMode.off);
    setState(() {});
  }

  InputImageRotation rotationIntToImageRotation(int rotation) {
    switch (rotation) {
      case 90:
        return InputImageRotation.Rotation_90deg;
      case 180:
        return InputImageRotation.Rotation_180deg;
      case 270:
        return InputImageRotation.Rotation_270deg;
      default:
        return InputImageRotation.Rotation_0deg;
    }
  }

  Future<void> detectFacesFromImage(CameraImage image) async {
    InputImageData _firebaseImageMetadata = InputImageData(
      imageRotation: rotationIntToImageRotation(
          _cameraController.description.sensorOrientation),
      inputImageFormat: InputImageFormat.BGRA8888,
      size: Size(image.width.toDouble(), image.height.toDouble()),
      planeData: image.planes.map(
        (Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList(),
    );

    InputImage _firebaseVisionImage = InputImage.fromBytes(
      bytes: image.planes[0].bytes,
      inputImageData: _firebaseImageMetadata,
    );
    var result = await _faceDetector.processImage(_firebaseVisionImage);
    if (result.isNotEmpty) {
      facesDetected = result;
    }
  }

  Future<void> _predictFacesFromImage({required CameraImage image}) async {
    await detectFacesFromImage(image);
    if (facesDetected.isNotEmpty) {
      UserRehabis? user = await _mlService.predict(
          image, facesDetected[0], false, widget.user.name!);
      if (widget.user == null) {
        // register case
        Fluttertoast.showToast(msg: "Unknown User");
      } else {
        // login case
        if (user == null) {
          Fluttertoast.showToast(msg: "Unknown User");
        } else {
          Auth.signIn();
          
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SelectWeakness()));
        }
      }
    }
    if (mounted) setState(() {});
    await takePicture();
  }

  Future<void> takePicture() async {
    if (facesDetected.isNotEmpty) {
      await _cameraController.stopImageStream();
      XFile file = await _cameraController.takePicture();
      file = XFile(file.path);
      _cameraController.setFlashMode(FlashMode.off);
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              const AlertDialog(content: Text('No face detected!')));
    }
  }

  @override
  void initState() {
    _cameraController = CameraController(cameras![1], ResolutionPreset.high);
    initializeCamera();
    _faceDetector = GoogleMlKit.vision.faceDetector(
      const FaceDetectorOptions(
        mode: FaceDetectorMode.accurate,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leadingWidth: 100,
          leading: Builder(
            builder: (BuildContext context) => 
            IconButton(
              icon: Row(
                children: [
                  Icon(Icons.add_box),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) => SignUp())));
              },
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  flash ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    flash = !flash;
                  });
                  flash
                      ? _cameraController.setFlashMode(FlashMode.torch)
                      : _cameraController.setFlashMode(FlashMode.off);
                }),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: isControllerInitialized
                    ? CameraPreview(_cameraController)
                    : null),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Lottie.asset("assets/loading.json",
                          width: MediaQuery.of(context).size.width * 0.7),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: CWidgets.customExtendedButton(
                        text: "SIGN IN",
                        context: context,
                        isClickable: true,
                        onTap: () {
                          bool canProcess = false;
                          _cameraController
                              .startImageStream((CameraImage image) async {
                            if (canProcess) return;
                            canProcess = true;
                            _predictFacesFromImage(image: image).then((value) {
                              canProcess = false;
                            });
                            return null;
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

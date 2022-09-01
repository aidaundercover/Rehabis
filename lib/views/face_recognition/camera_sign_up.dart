import 'package:camera/camera.dart';
import 'package:rehabis/api/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/main.dart';
import 'package:rehabis/utils/local_db.dart';
import 'package:rehabis/views/auth/sign_in.dart';
import 'package:rehabis/views/first_view/select_your_weak.dart';
import '../../models/user.dart';
import 'ml_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FaceScanScreenSignUp extends StatefulWidget {
  final UserRehabis? user;

  const FaceScanScreenSignUp({Key? key, this.user}) : super(key: key);

  @override
  _FaceScanScreenSignUpState createState() => _FaceScanScreenSignUpState();
}

class _FaceScanScreenSignUpState extends State<FaceScanScreenSignUp> {
  final TextEditingController _iinController = TextEditingController(text: "");
  final TextEditingController _nameController = TextEditingController(text: "");

  late CameraController _cameraController;
  bool flash = false;
  bool isControllerInitialized = false;
  late FaceDetector _faceDetector;
  final MLService _mlService = MLService();
  List<Face> facesDetected = [];
  bool isPressed = false;

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
          image,
          facesDetected[0],
          widget.user != null,
          widget.user != null ? widget.user!.name! : _nameController.text);

      if (widget.user == null) {
        // register case
        if (_nameController.text == '' || _iinController.text == '') {
          Fluttertoast.showToast(msg: "Fill every textfield!");
        } else if (_iinController.text.length != 12) {
          Fluttertoast.showToast(msg: "IIN consists of 12 digits");
        } else {
          Auth.signUp(context, _nameController, _iinController);

    
        }
      } else {
        // login case
        if (user == null) {
          Fluttertoast.showToast(msg: "Unknown User");
        } else {
          Fluttertoast.showToast(msg: "User already registered!");
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
          automaticallyImplyLeading: true,
          toolbarHeight: 50,
          shadowColor: Colors.transparent,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          leadingWidth: 100,
          leading: Builder(
            builder: (BuildContext context) => GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignIn()));
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
                  SizedBox(
                    width: width * 0.9,
                    child: TextFormField(
                      controller: _iinController,
                      maxLength: 12,
                    
                      validator: (input) {
                        _iinController.text = input!;
                        if (_iinController.text.contains(RegExp(r'[A-Z]'))) {
                          throw "IIN consists of only numbers";
                        }
                      },
                      decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.white),
                          hintText: "TIP: IIN contains 12 digits",
                           hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontFamily: 'Inter'),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(

                          hintText: "e.g. Aida",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4), 
                            fontFamily: 'Inter'
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: GestureDetector(
      onTap: () {
        setState(() {
                            isPressed = true;
                          });
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
      },
      child: Opacity(
        opacity: isPressed ? 0.4 : 1,
        child: Container(
          width: width*0.8,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: primaryColor),
          child: Center(
            child: Text(
              'SIGN UP',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600, fontFamily: "Inter"),
            ),
          ),
        ),
      ),
    )
                    
                    
                    
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

void getBornDate(String iin) {
  List nn = iin.split("");
}

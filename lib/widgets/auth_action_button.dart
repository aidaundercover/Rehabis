import 'package:flutter/material.dart';
import 'package:rehabis/database/database.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/models/user_model.dart';
import 'package:rehabis/services/authentication.dart';
import 'package:rehabis/services/camera_service.dart';
import 'package:rehabis/services/facenet_service.dart';
import 'package:rehabis/views/first_view/select_your_weak.dart';
import 'package:rehabis/widgets/app_button.dart';
import 'app_text_field.dart';

class AuthActionButton extends StatefulWidget {
  AuthActionButton(this._initializeControllerFuture,
      {Key? key,
      required this.onPressed,
      required this.isLogin,
      required this.reload});
  final Future _initializeControllerFuture;
  final Function onPressed;
  final bool isLogin;
  final Function reload;

  @override
  _AuthActionButtonState createState() => _AuthActionButtonState();
}

/// service injection
final FaceNetService _faceNetService = FaceNetService.faceNetService;
final CameraService _cameraService = CameraService();

final TextEditingController _nameController = TextEditingController(text: '');
final TextEditingController _iinController = TextEditingController(text: '');

User? predictedUser;

Future _signUp(context) async {
  /// gets predicted data from facenet service (user face detected)
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List? predictedData = _faceNetService.predictedData;
  print('AuthactionPredicatedData: $predictedData');
  String? name = _nameController.text;
  String? iin = _iinController.text;

  avatarPath = _cameraService.imagePath!;
  User userToSave = User(
    name: name,
    iin: iin,
    modelData: predictedData,
  );

  Auth.signUp(context, _nameController, _iinController);

  /// creates a new user in the 'database'

  await databaseHelper.insert(userToSave);
  _faceNetService.setPredictedData(null);
  _nameController.text = "";
  _iinController.text = "";

  // Auth.signUp(context, _nameController, _iinController);
}

/// resets the face stored in the face net sevice

Future _signIn(context) async {

  var user = await _predictUser();

  Auth.signIn(context, user?.iin);
  avatarPath = _cameraService.imagePath!;
}

Future<User?> _predictUser() async {
  User? userAndPass = await _faceNetService.predict();
  return userAndPass;
}

class _AuthActionButtonState extends State<AuthActionButton> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () async {
        try {
          // Ensure that the camera is initialized.
          await widget._initializeControllerFuture;
          // onShot event (takes the image and predict output)
          bool faceDetected = await widget.onPressed();

          if (faceDetected) {
            if (widget.isLogin) {
              var user = await _predictUser();
              print("NullIssue======${user?.name}");
              if (user != null) {
                predictedUser = user;
              } else {
                predictedUser = null;
              }
            }

            PersistentBottomSheetController bottomSheetController =
                Scaffold.of(context).showBottomSheet(
                    (context) => signSheet(context, predictedUser, width));
            bottomSheetController.closed.whenComplete(() => widget.reload());
          }
        } catch (e) {
          // If an error occurs, log the error to the console.
          print("dataFromdatabaseAuth1==$e");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor.withOpacity(0.3),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: primaryColor.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.7,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'CAPTURE',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.camera_alt, color: Colors.white)
          ],
        ),
      ),
    );
  }

  signSheet(context, User? predictedUser, double width) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isLogin && predictedUser != null
              ? Text(
                  'Hi, ' + predictedUser.name + '!',
                  style: TextStyle(fontSize: 20),
                )
              : widget.isLogin
                  ? Container(
                      child: Text(
                      'User not found 😞',
                      style: TextStyle(fontSize: 20),
                    ))
                  : Container(),
          Column(
            children: [
              widget.isLogin
                  ? Container()
                  : Column(children: [
                      SizedBox(
                        width: width * 0.7,
                        child: AppTextField(
                          controller: _iinController,
                          labelText: "IIN",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: width * 0.7,
                        child: AppTextField(
                          controller: _nameController,
                          labelText: "Your Name",
                        ),
                      )
                    ]),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              widget.isLogin && predictedUser != null
                  ? SizedBox(
                      width: width * 0.55,
                      child: AppButton(
                        text: 'LOGIN',
                        onPressed: () async {
                          _signIn(context);
                        },
                        icon: Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : !widget.isLogin
                      ? SizedBox(
                          width: width * 0.55,
                          child: AppButton(
                            text: 'SIGN UP',
                            onPressed: () async {
                              await _signUp(context);
                            },
                            icon: Icon(
                              Icons.person_add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

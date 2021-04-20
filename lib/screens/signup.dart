import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:max_food/network/api_provider.dart';
import 'package:max_food/utils/custom_icons_icons.dart';
import 'package:max_food/viewmodel/model/user.dart';
import 'package:max_food/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';
// import 'package:max_food/viewmodel/user_viewmodel.dart';
import 'package:validators/validators.dart';

typedef OnSaved(String value);

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (ctx) => UserViewModel(), child: SignUpScreenBody()),
    );
  }
}

class SignUpScreenBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenBodyState();
  }
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  double _fieldSpacingHeight = 16.0;
  final double _iconSize = 18;
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  UserViewModel _userViewModel;

  User user = User();

  @override
  Widget build(BuildContext context) {
    _userViewModel = Provider.of<UserViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_userViewModel.currentState == ViewState.REGISTERED) {
        Navigator.pushNamed(context, "/navigation_screen");
      } else if (_userViewModel.currentState == ViewState.FAILED && _userViewModel.signUpError.isNotEmpty) {
        Fluttertoast.showToast(msg: _userViewModel.signUpError);
      }
      else if(_userViewModel.formErrors!=null)
        {
          _formKey.currentState.validate();
          _userViewModel.formErrors = null;
        }
    });
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
              child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      "assets/images/bg_landing.jpg",
                      fit: BoxFit.fill,
                    )),
              ),
              Center(
                child: Container(
                  width: 130,
                  height: 130,
                  child: Image.asset("assets/images/logo.png"),
                ),
              )
            ],
          )),
        ),
        Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          NameField(
                              iconSize: _iconSize,
                              onSaved: (name) {
                                _userViewModel.user.name = name;
                              }),
                          SizedBox(
                            height: _fieldSpacingHeight,
                          ),
                          PhoneNoField(
                              iconSize: _iconSize,
                              onSaved: (phoneNo) {
                                _userViewModel.user.phone = phoneNo;
                              }),
                          SizedBox(
                            height: _fieldSpacingHeight,
                          ),
                          EmailField(
                              iconSize: _iconSize,
                              onSaved: (email) {
                                _userViewModel.user.email = email;
                              }),
                          SizedBox(
                            height: _fieldSpacingHeight,
                          ),
                          PasswordField(
                              iconSize: _iconSize,
                              onSaved: (password) {
                                _userViewModel.user.password = password;
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    _userViewModel.currentState == ViewState.LOADING
                        ? CircularProgressIndicator()
                        : RegisterButton(
                            iconSize: _iconSize,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                _userViewModel.registerUser();
                              }
                            }),
                    SizedBox(
                      height: 16,
                    ),
                    BackButton(onTap: () {
                      Navigator.pop(context);
                    })
                  ],
                ),
              ),
            ))
      ],
    );
  }

  NameField({double iconSize, OnSaved onSaved}) => TextFormField(
        decoration: InputDecoration(
            labelText: 'Name',
            prefixIcon: Icon(
              CustomIcons.user,
              size: _iconSize,
            )),
        validator: (val) {
          if (val.isEmpty) {
            return "Please enter your name";
          } else if (val.length < 3) {
            return "Name Should at least be 3 characters ";
          }

          try {
            String apiError = _userViewModel?.formErrors["name"][0];
            return apiError;
          } catch (e) {
            return null;
          }
        },
        onSaved: (name) {
          onSaved(name);
        },
      );
  PhoneNoField({double iconSize, OnSaved onSaved}) => TextFormField(
        onSaved: (phone) {
          onSaved(phone);
        },
        decoration: InputDecoration(
            labelText: 'Phone no',
            prefixIcon: Icon(
              CustomIcons.phone_handset,
              size: _iconSize,
            )),
        validator: (phone) {
          if (phone.isEmpty) {
            return "Please enter your phone no";
          } else if (!isNumeric(phone)) {
            return "Invalid Phone No";
          }
          try {
            String apiError = _userViewModel?.formErrors["phone"][0];
            return apiError;
          } catch (e) {
            return null;
          }
          return null;
        },
      );
  EmailField({double iconSize, OnSaved onSaved}) => TextFormField(
        onSaved: (email) => onSaved(email.trim()),
        decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(
              CustomIcons.mail,
              size: _iconSize,
            )),
        validator: (email) {
          email = email.trim();
          if (email.isEmpty) {
            return "Please enter your email";
          } else if (!isEmail(email)) {
            return "Invalid Email";
          }

          try {
            String apiError = _userViewModel?.formErrors["email"][0];
            return apiError;
          } catch (e) {
            return null;
          }

        },
      );
  PasswordField({double iconSize, OnSaved onSaved}) => TextFormField(
        onSaved: (password) => onSaved(password),
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(
            CustomIcons.lock,
            size: _iconSize,
          ),
        ),
        validator: (password) {
          if (password.isEmpty) {
            return "Please enter your password";
          } else if (password.length < 6) {
            return "Password should at least be 6 characters";
          } else if (!isAlphanumeric(password)) {
            return "Password should contain both letter and number";
          }
          try {
            String apiError = _userViewModel?.formErrors["password"][0];
            return apiError;
          } catch (e) {
            return null;
          }
        },
      );
  RegisterButton({double iconSize, Function onPressed}) => Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          color: Colors.redAccent,
          shape: StadiumBorder(),
          onPressed: () {
            onPressed();
          },
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
  BackButton({@required Function onTap}) => InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Go Back",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        onTap: () {
          onTap();
        },
      );
}

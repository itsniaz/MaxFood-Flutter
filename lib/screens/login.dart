import 'package:flutter/material.dart';
import 'package:max_food/network/api_provider.dart';
import 'package:max_food/utils/constants.dart';
import 'package:max_food/utils/custom_icons_icons.dart';
import 'package:max_food/utils/shared_perference_manager.dart';
import 'package:max_food/viewmodel/menu_viewmodel.dart';
import 'package:max_food/viewmodel/model/user.dart';
import 'package:max_food/viewmodel/user_viewmodel.dart' as uservm;
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpScreenBody(),
    );
  }
}

class SignUpScreenBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenBodyState();
  }

}

class _LoginScreenBodyState extends State<SignUpScreenBody> {

  double _fieldSpacingHeight = 16.0;
  double _iconSize = 18;
  final _formKey = GlobalKey<FormState>();

  User _user = User();

  bool isLoading =  false;

  uservm.UserViewModel _userViewModel;

  @override
  Widget build(BuildContext context) {

    _userViewModel = Provider.of<uservm.UserViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {

      if(_userViewModel.currentState == uservm.ViewState.REGISTERED)
      {
        Navigator.pushNamed(context, Routes.LANDING);
      }
      else if(_userViewModel.currentState == uservm.ViewState.FAILED && _userViewModel.loginError.isNotEmpty)
      {
        Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent,content: Row(children: [
          Icon(Icons.error),
          SizedBox(width: 8,),
          Text(_userViewModel.loginError),
        ],)));
      }
    });

    var EmailField =    TextFormField(
      decoration: InputDecoration(labelText: 'Email',prefixIcon: Icon(CustomIcons.mail,size: _iconSize,)),
      onSaved: (email){
        _user.email = email.trim();
      },
      validator: (email)
      {
        email = email.trim();
        if (email.isEmpty) {
          return "Please enter your email";
        } else if (!isEmail(email)) {
          return "Invalid Email";
        }
        return null;
      },
    );
    var PasswordField =    TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(CustomIcons.lock,size: _iconSize,),),
      onSaved: (password){
        _user.password = password;
      },
      validator: (password){
        if (password.isEmpty) {
          return "Please enter your password";
        } else if (password.length < 6) {
          return "Password should at least be 6 characters";
        }
        return null;
      },
    );
    var LoginButton =     Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        color: Colors.redAccent,
        shape: StadiumBorder(),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            _userViewModel.authenticate(
                        email: _user.email,
                        password:  _user.password
                      );
          }
        },
        child: Text("Login",style: TextStyle(color: Colors.white),),
      ),
    );
    var registerButton = Container(
      padding: EdgeInsets.all(8.0),
      child: InkWell(child: Text("Don't have an account ?",style: TextStyle(fontSize: 16,color: Colors.black54),)
        , onTap: (){
          Navigator.pushNamed(context,"/register");
        },
      ),
    );

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
            child: Center(
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
                            EmailField,
                            SizedBox(height: _fieldSpacingHeight,),
                            PasswordField,
                          ],
                        ),
                      ),
                      SizedBox(height: 36,),
                      Container(
                        height: 60,
                        child: AnimatedSwitcher(duration: Duration(milliseconds: 300),
                          child:  _userViewModel.currentState == uservm.ViewState.LOADING ? CircularProgressIndicator() : LoginButton,
                        ),
                      ),
                      SizedBox(height: 16,),
                      registerButton
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

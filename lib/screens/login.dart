import 'package:flutter/material.dart';
import 'package:max_food/network/api_provider.dart';
import 'package:max_food/utils/custom_icons_icons.dart';
import 'package:max_food/utils/shared_perference_manager.dart';
import 'package:max_food/viewmodel/model/user.dart';
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

  @override
  Widget build(BuildContext context) {
    var EmailField =    TextFormField(
      decoration: InputDecoration(labelText: 'Email',prefixIcon: Icon(CustomIcons.mail,size: _iconSize,)),
      onSaved: (email){
        _user.email = email;
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

          Navigator.pushNamed(context, "/navigation_screen");

          // if(_formKey.currentState.validate())
          //   {
          //     _formKey.currentState.save();
          //
          //     setState(()=>isLoading = true);
          //
          //     ApiProvider.getInstance().authenticate(user: _user, onAuthSuccess: (User _user){
          //
          //       SharedPrefManager.getInstance().saveUser(_user);
          //
          //       setState(()=>isLoading = false);
          //
          //
          //     }, onAuthFailure: (String error){
          //
          //       setState(()=>isLoading = false);
          //
          //       Scaffold.of(context).showSnackBar(SnackBar(
          //           backgroundColor: Colors.redAccent, content: Row(
          //         children: [
          //           SizedBox(width: 8,),
          //           Icon(Icons.info,color: Colors.white,),
          //           SizedBox(width: 16,),
          //           Text(error,style: TextStyle(color: Colors.white),)
          //         ],
          //       )));
          //
          //     });
          //   }
        },
        child: Text("Login",style: TextStyle(color: Colors.white),),
      ),
    );
    var registerButton = Container(
      padding: EdgeInsets.all(8.0),
      child: InkWell(child: Text("Don't have an account ?",style: TextStyle(fontSize: 16,color: Colors.black54),)
        , onTap: (){
          Navigator.pushNamed(context,"/signup");
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
                      isLoading ? CircularProgressIndicator() : LoginButton,
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

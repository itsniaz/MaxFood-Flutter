import 'package:flutter/material.dart';
import 'package:max_food/utils/custom_icons_icons.dart';

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


  @override
  Widget build(BuildContext context) {
    var EmailField =    TextFormField(
      decoration: InputDecoration(labelText: 'Phone no',prefixIcon: Icon(CustomIcons.phone_handset,size: _iconSize,)),
    );
    var PasswordField =    TextFormField(
      decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(CustomIcons.lock,size: _iconSize,),),
    );
    var LoginButton =     Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        color: Colors.redAccent,
        shape: StadiumBorder(),
        onPressed: () {
          _formKey.currentState.validate();
        },
        child: Text("Login",style: TextStyle(color: Colors.white),),
      ),
    );
    var BackButton = InkWell(child: Text("Back to Landing Page",style: TextStyle(fontSize: 16,color: Colors.black54),)
      , onTap: (){
        Navigator.pop(context);
      },
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
                      LoginButton,
                      SizedBox(height: 16,),
                      BackButton
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

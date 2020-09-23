import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LandingScreenState();
  }

}

class _LandingScreenState extends State<LandingScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                   child: Opacity(opacity : 0.2,child: Image.asset("assets/images/bg_landing.jpg",fit: BoxFit.fill,)),
                  ),
                  Center(
                    child: Container(
                      width: 130,
                      height: 130,
                      child: Image.asset("assets/images/logo.png"),

                    ),
                  )
                ],
              )
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: StadiumBorder(),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google_g.png",width: 46,height: 46,),
                          SizedBox(width: 12,),
                          Text("Sign in With Google",style: TextStyle(color: Colors.grey.shade700),),
                        ],
                      )                  ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.black,
                      shape: StadiumBorder(),
                      onPressed: () {},
                      child: Text("Login with OTP",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  SizedBox(height: 24,),
                  InkWell(child: Text("Don't have an account ?",style: TextStyle(fontSize: 16,color: Colors.black54),),
                  onTap: (){
                    Navigator.pushNamed(context, "/signup");
                  },
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }

}
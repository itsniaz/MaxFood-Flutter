import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:max_food/utils/shared_perference_manager.dart';
import 'package:max_food/viewmodel/model/home.dart';
import 'package:max_food/viewmodel/model/menu.dart';
import 'package:max_food/viewmodel/model/user.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

typedef ShouldLogout(bool shouldLogout);

typedef OnRegisterSuccess(User user);
typedef OnRegisterFailure(String reason);
typedef OnFromValueError(Map<String, dynamic> errors);
typedef OnAuthSuccess(User user);
typedef OnAuthFailure(String reason);

typedef OnHomeDataFetched(Home home);
typedef OnFailure(String reason);
typedef OnMenuFetched(Menu menu);


class ApiProvider {
  final String _baseUrl = "https://maxfood.nurkarim.me/api";
  final Dio _dio = Dio();

  String tempToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiY2U1NWJmZGJlZDA4NWJjM2UzMDNiZDU0NDkwOGFlYmRmYWI0MWNkODc0MjVhNmJlMjE4NDZlNzJlZjdiYTU3MzM0YmQzZTZhNDFlYzk3ZjkiLCJpYXQiOjE2MDQyMzgyMTQsIm5iZiI6MTYwNDIzODIxNCwiZXhwIjoxNjM1Nzc0MjE0LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.cRz1sCrfTF-eF-i3dkjvwIO9vtfGr2Pj-gprni7kJD4xFvm57G9qfBIVAo4XOHBiijVaZWw0BKER04q6jV7FGsnljrFlP0vsYpj_x0sXlkEaA82_fUsvOrTPqCvnUR72sPb73_aGPinMDy4z4pp2xQtmS687gmT0-pXP47IHTfyCRgR0D-IB02TRknl6ZYcFnqAyTY6rFf04PWBC9ANQoXPZbY98qzGR2Ihov6eEPUkFw1-UAtlo6c140cfM1aSnUF4o3MrQXmX9YbGuMeDd697VWRzwfSq5AFgpI4Bd0lBEyl5POzqZ4Ru-A6hfdEZFwfBOBnJ4U139FuIMY4eCb9cHXAuw8peX0eAoPs54_NdfpolOfyp58iGIMSKRCxxSfJEVOhP3HYVEE6ESe7H_oun_VjnVLseK3Yt8lpPLC2JAhDby4G7mxFt8wsMuHlksIDlImK1OGxooDIDKHOW4k5Gaxjc80Aynz-BbFLkbvZk-0UpZ4dX1MhInVNSowCsFJJ0m1j7gRjQ8fRnmvkKT5W57m9DjnzP6eZ3j1pj9pwfaRsjtIE7xjyOKbyLerGwbQFv6BB9pogTaHWXs_JIfG813Fm6blJBTPJSCSTibjs3cHqt1E9Wz9GbcGv72YQEXMEt9pF6_TvxbTZQnk4TNwWTfFK-GN2hybmWbsFpMBfY";

  static ApiProvider _instance;

  ApiProvider._internal() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  static ApiProvider getInstance() {
    if (_instance == null) {
      _instance = ApiProvider._internal();
    }

    return _instance;
  }

  void registerUser(
      {@required User user,
      @required OnRegisterSuccess onRegisterSuccess,
      @required OnRegisterFailure onRegisterFailure,
      ShouldLogout shouldLogout,
      OnFromValueError onFromValueError}) async {
    try {
      Response response = await _dio.post('/register', data: user);
      if (response.statusCode == HttpStatus.ok) {
        User user = User.fromJson(response.data["data"]);

        onRegisterSuccess(user);
      } else {
        onRegisterFailure("Failure");
      }
    } catch (error, stacktrace) {
      print(stacktrace);
      if (error is DioError) {
        if (error.response.statusCode == HttpStatus.unauthorized) {
          shouldLogout(true);
        } else if (error.response.data["data"] != null) {
          onFromValueError(error.response.data["data"]);
        }
      } else {
        onRegisterFailure(error.toString());
      }
    }
  }

  void authenticate({@required String email,@required String password, @required OnAuthSuccess onAuthSuccess,@required OnAuthFailure onAuthFailure}) async
  {

    try{
      String token = await SharedPrefManager.getInstance().getToken();
      Response response  = await _dio.post("/login",
        data: {
          "email" : email,
          "password" : password
        }
      );

      if(response.statusCode == HttpStatus.ok)
      {
        User user = User.fromJson(response.data["data"]);
        onAuthSuccess(user);
      }
    }
    catch(error, stacktrace)
    {
      print(stacktrace);

      if(error is DioError && error.response.data!=null)
      {
        String reason = error.response.data["data"]["error"];
        onAuthFailure(reason);
      }
      else
      {
        onAuthFailure(error.toString());
      }
    }
  }



  void getHomeInfo({@required OnHomeDataFetched onHomeDataFetched,OnFailure onFailure}) async{
   try{
     String token =  await SharedPrefManager.getInstance().getToken();
     Response response  = await _dio.get("/homeApi",
         options: Options(headers: {"Authorization": "Bearer $token"}
     ));

     if(response.statusCode == HttpStatus.ok)
       {
         Home home = Home.fromJson(response.data["data"]);
         onHomeDataFetched(home);
       }
   }
   catch(error, stacktrace)
    {
      print(stacktrace);

      if(error is DioError)
        {
          onFailure(error.message);
        }
      else
        {
          onFailure(error.toString());
        }
    }
  }

  void getMenu({@required OnMenuFetched onMenuFetched,OnFailure onFailure}) async{
    try{
      String token =  await SharedPrefManager.getInstance().getToken();
      Response response  = await _dio.get("/menusFoods",
          options: Options(headers: {"Authorization": "Bearer $token"}
          ));

      if(response.statusCode == HttpStatus.ok)
      {
        Menu menu = Menu.fromJson(response.data["data"]);
        onMenuFetched(menu);
      }
    }
    catch(error, stacktrace)
    {
      print(stacktrace);

      if(error is DioError)
      {
        onFailure(error.message);
      }
      else
      {
        onFailure(error.toString());
      }
    }
  }
}

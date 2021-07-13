import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:zignut_practicle/bloc/dashboard/dashboard_bloc.dart';
import 'package:zignut_practicle/bloc/login_bloc.dart';
import 'package:zignut_practicle/constants/app_constants.dart';
import 'package:zignut_practicle/constants/url_constants.dart';
import 'package:zignut_practicle/model/dashboard_response_model.dart';
import 'package:zignut_practicle/model/dashhboard_request_parameter_model.dart';
import 'package:zignut_practicle/model/login_model.dart';
import 'package:zignut_practicle/model/sign_up_model.dart';
import 'package:zignut_practicle/model/sign_up_response_model.dart';

class LoginRepository{

  Future<LoginState> loginUser({LoginModel loginModel}) async{
    try {
      print(UrlConstants.LOGIN_URL);
      Map<String, dynamic> bodyData = loginModel.toJson();
      print(loginModel.toJson());
      final response = await http.post(
          Uri.parse("${UrlConstants.LOGIN_URL}"),
          headers: AppConstants.AUTHORIZATION_HEADER,
          body: bodyData
      ).timeout(AppConstants.TIMEOUT_DURATIOnN);
      print(response.body);
      print(true);
      final jsonData = jsonDecode(response.body);
      if (response.statusCode.isBetween(200, 299)) {
        AppConstants.prefs.setString('Token', jsonData['data']['token']);//SignUpResponseModel.fromJson(jsonData).data.userData.deviceToken
        AppConstants.prefs.setBool('ISLoggedIn', true);
        return LoginSuccessState();
      } else {
        if (response.statusCode == 401)
          return LoginErrorState(
              errorMessage: 'Error Unauthorize');
        else
          return LoginErrorState(
              errorMessage: jsonData["error"]);
      }
    } on SocketException {
      return LoginErrorState(
          errorMessage: 'No Internet');
    } on TimeoutException {
      return LoginErrorState(
          errorMessage: 'TimeOut occured');
    } on Exception {
      return LoginErrorState(
          errorMessage: 'Something went wrong');
    } catch(c){
      print(c);
      return LoginErrorState(
          errorMessage: 'Something went wrong');
    }
  }

  Future<LoginState> signUpUser({SignUpModel signUpModel}) async{
    try {
      print(signUpModel.toJson());
      http.Response response = await http.post(
          Uri.parse("${UrlConstants.SignUP_URL}"),
          headers: AppConstants.AUTHORIZATION_HEADER,
          body: signUpModel.toJson()
      ).timeout(AppConstants.TIMEOUT_DURATIOnN);
      print(response.body);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      if (response.statusCode.isBetween(200, 299)) {
        return SignUpSuccessState();
      } else {
        if (response.statusCode == 401)
          return LoginErrorState(
              errorMessage: 'Error Unauthorize');
        else
          return LoginErrorState(
              errorMessage: jsonData["error"]);
      }
    } on SocketException {
      return LoginErrorState(
          errorMessage: 'No Internet');
    } on TimeoutException {
      return LoginErrorState(
          errorMessage: 'TimeOut occured');
    } on Exception {
      return LoginErrorState(
          errorMessage: 'Something went wrong');
    } catch(c){
      print(c);
      return LoginErrorState(
          errorMessage: 'Something went wrong');
    }
  }

  Future<DashboardState> customerCourseList(DashboardParameterModel dashboardParameterModel) async{
    try {
      http.Response response = await http.post(
          Uri.parse("${UrlConstants.Dashbord_URL}"),
          headers: {
      'Accept' : 'application/json',
      'Authorization' : 'Bearer ${AppConstants.prefs.getString('Token')}',
      'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: jsonEncode(dashboardParameterModel)
      ).timeout(AppConstants.TIMEOUT_DURATIOnN);
      print(response.body);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      if (response.statusCode.isBetween(200, 299)) {
        return DashboardLoadedState(DashboardResponseModel.fromJson(jsonData));
      } else {
        if (response.statusCode == 401)
          return DashboardErrorState(
              errorMessage: 'Error Unauthorize');
        else
          return DashboardErrorState(
              errorMessage: jsonData["error"]);
      }
    } on SocketException {
      return DashboardErrorState(
          errorMessage: 'No Internet');
    } on TimeoutException {
      return DashboardErrorState(
          errorMessage: 'TimeOut occured');
    } on Exception {
      return DashboardErrorState(
          errorMessage: 'Something went wrong');
    } catch(c){
      print(c);
      return DashboardErrorState(
          errorMessage: 'Something went wrong');
    }
  }
}
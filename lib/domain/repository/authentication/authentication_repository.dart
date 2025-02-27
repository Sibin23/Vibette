import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibette/application/core/constants/urls.dart';
import 'package:vibette/domain/models/user/user_model.dart';
import 'package:vibette/infrastructure/fuctions/set_user_logged_in.dart';

class AuthenticationRepository {
  static var client = http.Client();
  static Future<String> signupuser({required UserModel user}) async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse('${ApiUrl.baseUrl}${ApiUrl.signUp}'),
          body: jsonEncode(user),
          headers: {'Content-Type': 'application/json'});
      debugPrint('statuscode:${response.statusCode}');
      debugPrint(response.body);
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return 'Successful';
      } else if (responseBody['message'] == "You already have an account.") {
        return 'You already have an account';
      } else if (responseBody['message'] ==
          "OTP already sent within the last one minute") {
        return 'OTP already sent within the last one minute';
      } else if (responseBody['message'] == "The username is already taken.") {
        return 'The username is already taken.';
      } else if (response.statusCode == 500) {
        return 'Internal server Error';
      } else {
        return ' failed';
      }
    } catch (e) {
      debugPrint(e.toString());
      log(e.toString() as num);
      return 'failed';
    }
  }

  Future<Response?> sentOtp(UserModel user) async {
    var data = {
      "name": user.userName,
      "email": user.emailId,
      "password": user.password,
      "phone": user.phoneNumber
    };
    debugPrint('User data is $data');
    var jsonData = jsonEncode(data);

    debugPrint(ApiUrl.baseUrl + ApiUrl.signUp);

    try {
      final response = await client.post(
        Uri.parse(ApiUrl.baseUrl + ApiUrl.signUp),
        body: jsonData,
        headers: {
          "Content-Type": "application/json",
        },
      );

      return response;
    } catch (e) {
      debugPrint('+++++++++');
      debugPrint(e.toString());
      return null;
    }
  }

  //otp
  static Future<Response?> verifyOtp(
    String email,
    String otp,
  ) async {
    var client = http.Client();
    try {
      var data = {'email': email, 'otp': otp};
      var response = await client.post(
        Uri.parse(ApiUrl.baseUrl + ApiUrl.verifyOtp),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
        },
      );

      debugPrint(response.body);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //signin
  static Future<Response?> userLogin(
      {required String email, required String password}) async {
    var client = http.Client();
    try {
      final loginuser = {'email': email, 'password': password};
      print('user login is $loginuser');
      var response = await client.post(
        Uri.parse(ApiUrl.baseUrl + ApiUrl.login),
        body: jsonEncode(loginuser),
      );
      debugPrint('statuscode:${response.statusCode}');
      debugPrint(response.body);
      final responsebody = jsonDecode(response.body);
      // print(responsebody['message']);
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
        preferences.setString('USER_TOKEN', responsebody['user']['token']);
        preferences.setString('USER_ID', responsebody['user']['_id']);
        preferences.setString('USER_NAME', responsebody['user']['userName']);
        return response;
      } else {
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
      log(e.toString() as num);
      return null;
    } finally {
      client.close();
    }
  }

  static Future<Response?> googleLogin(String email) async {
    try {
      final finalEmail = {'email': email};
      var response = await client.post(
          Uri.parse(ApiUrl.baseUrl + ApiUrl.googleLogin),
          body: jsonEncode(finalEmail),
          headers: {"Content-Type": 'application/json'});

      // print(response.body);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print("google signin$responseBody");
        await setUserLoggedin(
          token: responseBody['user']['token'],
          userrole: responseBody['user']['role'],
          userid: responseBody['user']['_id'],
          userEmail: responseBody['user']['email'],
          userName: responseBody['user']['userName'],
          userprofile: responseBody['user']['profilePic'],
        );
      }
      return response;
    } catch (e) {
      return null;
    }
  }

  static Future<Response?> resetPasswordSentOtp(String email) async {
    try {
      Response? response = await client.get(
        Uri.parse("${ApiUrl.baseUrl + ApiUrl.forgotPassword}$email"),
      );
      debugPrint('${ApiUrl.baseUrl + ApiUrl.forgotPassword}$email');

      if (kDebugMode) {
        print(response.body);
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<Response?> verifyOtpPasswordReset(
      String email, String otp) async {
    try {
      var response = await client.get(Uri.parse(
          '${ApiUrl.baseUrl + ApiUrl.verifyOtpReset}$email&otp=$otp'));
      debugPrint(response.body);
      debugPrint('${ApiUrl.baseUrl + ApiUrl.verifyOtpReset}$email&otp=$otp');
      return response;
    } catch (e) {
      return null;
    }
  }

  static Future<Response?> updatePassword(String email, String password) async {
    try {
      var user = {'email': email, 'password': password};
      var response = await client.patch(
          Uri.parse(ApiUrl.baseUrl + ApiUrl.updatePassword),
          body: jsonEncode(user),
          headers: {"Content-Type": 'application/json'});
      if (kDebugMode) {
        print(response.body);
      }
      return response;
    } catch (e) {
      return null;
    }
  }
}

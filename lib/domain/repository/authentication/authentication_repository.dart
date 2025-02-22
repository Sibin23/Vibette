import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:vibette/application/core/constants/urls.dart';
import 'package:vibette/domain/models/user/user_model.dart';

class AuthenticationRepository {
  static var client = http.Client();
  Future<Response?> sentOtp(UserModel user) async {
    var data = {
      "userName": user.userName,
      "email": user.emailId,
      "password": user.password,
      "phone": user.phoneNumber
    };
    var jsonData = jsonEncode(data);

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
}

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibette/application/core/constants/constants.dart';

String currentuserId = '';

Future<void> setUserLoggedin(
    {required String token,
    required String userid,
    required String userrole,
    required String userEmail,
    required String userName,
    required String userprofile}) async {
  final sharedprefs = await SharedPreferences.getInstance();
  await sharedprefs.setBool(authKey, true);
  await sharedprefs.setString(tokenKey, token);
  await sharedprefs.setString(userIdKey, userid);
  await sharedprefs.setString(userRolekey, userrole);
  await sharedprefs.setString(userEmailkey, userEmail);
  await sharedprefs.setString(userNamekey, userName);
  await sharedprefs.setString(userProfilePickey, userprofile);
}
// get user token

Future<String?> getUsertoken() async {
  final sharedpreference = await SharedPreferences.getInstance();
  final token = sharedpreference.getString(tokenKey);
  return token;
}

//get Userid
Future<String?> getUserId() async {
  final sharedpreference = await SharedPreferences.getInstance();
  final userId = sharedpreference.getString(userIdKey);

  print('shared preference gerUserId');

  currentuserId = userId.toString();
  print('currentuserId   $currentuserId');
  return userId;
}

// Clear user session
Future<void> clearUserSession() async {
  final sharedprefs = await SharedPreferences.getInstance();
  await sharedprefs.remove(authKey);
  await sharedprefs.remove(tokenKey);
  await sharedprefs.remove(userIdKey);
  await sharedprefs.remove(userRolekey);
  await sharedprefs.remove(userEmailkey);
  await sharedprefs.remove(userNamekey);
  await sharedprefs.remove(userProfilePickey);
}

Future<void> pickImage(ValueNotifier<String> imageNotifier) async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    imageNotifier.value = pickedFile.path;
  }
}

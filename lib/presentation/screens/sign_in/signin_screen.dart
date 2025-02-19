import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/screens/sign_in/desktop/signin_screen_desktop.dart';
import 'package:vibette/presentation/screens/sign_in/mobile/signin_screen_mobile.dart';
import 'package:vibette/presentation/screens/sign_in/tablet/signin_screen_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Theme.of(context);
    return Scaffold(
      body: AppLayout(
          mobileLayout: SignInScreenMobile(
            appTheme: appTheme,
            size: size,
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            
          ),
          tabletLayout: SigninScreenTablet(
            emailController: emailController,
            formKey: formKey,
            passwordController: passwordController,
            size: size,
            appTheme: appTheme,
            onGoogleButtonClicked: () {},
            onSigninButtonClicked: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', true);
              context.goNamed(RouterConstants.basePage);
            },
          ),
          desktopLayout: SigninScreenDesktop(
            appTheme: appTheme,
            emailController: emailController,
            formKey: formKey,
            passwordController: passwordController,
            size: size,
            onGoogleButtonClicked: () {},
            onSigninButtonClicked: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', true);
              context.goNamed(RouterConstants.basePage);
            },
          )),
    );
  }
}

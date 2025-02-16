import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/sign_in/desktop/signin_screen_desktop.dart';
import 'package:vibette/presentation/screens/sign_in/mobile/signin_screen_mobile.dart';
import 'package:vibette/presentation/screens/sign_in/tablet/signin_screen_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppLayout(
          mobileLayout: SignInScreenMobile(
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
          ),
          desktopLayout: SigninScreenDesktop(
              emailController: emailController,
              formKey: formKey,
              passwordController: passwordController,
              size: size)),
    );
  }
}

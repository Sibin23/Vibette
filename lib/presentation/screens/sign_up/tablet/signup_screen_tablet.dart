import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/sign_up/mobile/signup.dart';

class SignUpScreenTablet extends StatelessWidget {
  const SignUpScreenTablet(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.phoneController,
      required this.size});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
          child: Center(
        child: SizedBox(
          width: size.width * 0.7,
          child: SignUpScreenMobile(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              phoneController: phoneController,
              size: size),
       
        ),
      )),
    );
  }
}

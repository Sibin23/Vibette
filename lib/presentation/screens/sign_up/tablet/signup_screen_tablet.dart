import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/sign_up/mobile/signup_screen_mobile.dart';

class SignUpScreenTablet extends StatelessWidget {
  const SignUpScreenTablet(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.phoneController,
      required this.size,
      required this.formkey});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final Size size;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: SizedBox(
            width: size.width * 0.7,
            child: SignUpScreenMobile(
                formkey: formkey,
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                phoneController: phoneController,
                size: size),
          ),
        ),
      )),
    );
  }
}

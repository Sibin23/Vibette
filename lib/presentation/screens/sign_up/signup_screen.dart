import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/sign_up/desktop/signup_screen_desktop.dart';
import 'package:vibette/presentation/screens/sign_up/mobile/signup_screen_mobile.dart';
import 'package:vibette/presentation/screens/sign_up/tablet/signup_screen_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppLayout(
          mobileLayout: SignUpScreenMobile(
            formkey: formkey,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            phoneController: phoneController,
            size: size,
          ),
          tabletLayout: SignUpScreenTablet(
            formkey: formkey,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            phoneController: phoneController,
            size: size,
          ),
          desktopLayout: SignUpScreenDesktop(
            formkey: formkey,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            phoneController: phoneController,
            size: size,
          )),
    );
  }
}

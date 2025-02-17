import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/sign_up/desktop/signup_screen_desktop.dart';
import 'package:vibette/presentation/screens/sign_up/mobile/signup.dart';
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppLayout(
          mobileLayout: SignUpScreenMobile(
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            phoneController: phoneController,
            size: size,
          ),
          tabletLayout: SignUpScreenTablet(
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            phoneController: phoneController,
            size: size,
          ),
          desktopLayout: SignUpScreenDesktop(
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

import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/forgot_password/desktop/resetpassword_desktop.dart';
import 'package:vibette/presentation/screens/forgot_password/mobile/resetpassword_mobile.dart';
import 'package:vibette/presentation/screens/forgot_password/tablet/resetpassword_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppLayout(
        mobileLayout: ResetpasswordMobileScreen(
          email: widget.email,
          size: size,
          formkey: formKey,
          password: passwordController,
          confirmPassword: confirmPasswordController,
        ),
        tabletLayout: ResetpasswordTabletScreen(
          email: widget.email,
          formkey: formKey,
          size: size,
          password: passwordController,
          confirmPassword: confirmPasswordController,
        ),
        desktopLayout: ResetpasswordDesktopScreen(
          email: widget.email,
          formkey: formKey,
          size: size,
          password: passwordController,
          confirmPassword: confirmPasswordController,
        ),
      ),
    );
  }
}

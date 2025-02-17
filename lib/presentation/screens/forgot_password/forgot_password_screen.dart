import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/forgot_password/desktop/forgot_password_desktop.dart';
import 'package:vibette/presentation/screens/forgot_password/mobile/forgot_password_mobile.dart';
import 'package:vibette/presentation/screens/forgot_password/tablet/forgot_passoword_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AppLayout(
          mobileLayout: ForgotPasswordMobile(
            email: email,
            formKey: formKey,
            size: size,
          ),
          tabletLayout: ForgotPassowordTablet(
            formkey: formKey,
            email: email,
            size: size,
          ),
          desktopLayout: ForgotPasswordDesktop(
            email: email,
            formKey: formKey,
            size: size,
          )),
    );
  }
}

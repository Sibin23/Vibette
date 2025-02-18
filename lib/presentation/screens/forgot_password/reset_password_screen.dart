import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/screens/forgot_password/desktop/resetpassword_desktop.dart';
import 'package:vibette/presentation/screens/forgot_password/mobile/resetpassword_mobile.dart';
import 'package:vibette/presentation/screens/forgot_password/tablet/resetpassword_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

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
          size: size,
          formkey: formKey,
          password: passwordController,
          confirmPassword: confirmPasswordController,
          voidCallback: () {
            context.goNamed(RouterConstants.signIn);
          },
        ),
        tabletLayout: ResetpasswordTabletScreen(
            formkey: formKey,
            size: size,
            password: passwordController,
            confirmPassword: confirmPasswordController,
            voidCallback: () {
              context.goNamed(RouterConstants.signIn);
            }),
        desktopLayout: ResetpasswordDesktopScreen(
            formkey: formKey,
            size: size,
            password: passwordController,
            confirmPassword: confirmPasswordController,
            voidCallback: () {
              context.goNamed(RouterConstants.signIn);
            }),
      ),
    );
  }
}

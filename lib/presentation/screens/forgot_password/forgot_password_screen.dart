import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router.dart';
import 'package:vibette/presentation/screens/login_screen/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final email = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appTheme(context),
      appBar: AppBar(
        backgroundColor: appTheme(context),
        centerTitle: true,
        title: Text(
          'Forgot Password?',
          style: Theme.of(context).brightness == Brightness.dark
              ? title2W
              : title2B,
        ),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          h30,
          const VibetteLogo(),
          h30,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Enter your email address to reset your password.',
                    style: Theme.of(context).brightness == Brightness.dark
                        ? subtitleNormalW
                        : subtitleNormalB,
                  ),
                  h20,
                  TextFieldAuthentication(
                      prefixIcon: Icons.email_outlined,
                      controller: email,
                      validator: validateEmail,
                      hintText: 'abc@gmail.com',
                      keyboardType: TextInputType.emailAddress),
                  h30,
                  AppThemeButton(
                      size: size,
                      voidCallback: () {
                        if (formKey.currentState!.validate()) {
                          context.pushReplacementNamed(homeScreen);
                        }
                      },
                      buttonText: 'Get OTP'),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

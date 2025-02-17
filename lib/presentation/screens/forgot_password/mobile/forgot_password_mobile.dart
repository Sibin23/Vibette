import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({super.key, required this.size, required this.email, required this.formKey});
  final Size size;
  final TextEditingController email;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Forgot Password?',
            style: Theme.of(context).textTheme.titleLarge),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          h30,
          const VibetteLogo(),
          Text(
            'Vibette',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          h30,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Enter your email address to reset your password.',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                        //if (formKey.currentState!.validate()) {
                        context.push(RouterConstants.otpVerification);
                        //  }
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

import '../widgets/vibette_logo.dart';

class SignInScreenMobile extends StatelessWidget {
  const SignInScreenMobile(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey,
      required this.size,
      required this.onSigninButtonClicked,
      required this.onGoogleButtonClicked, required this.appTheme});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final Size size;
  final VoidCallback onSigninButtonClicked;
  final VoidCallback onGoogleButtonClicked;
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            h40,
            const VibetteLogo(),
            Text(
              'Vibette',
              textAlign: TextAlign.center,
              style: appTheme.textTheme.displayLarge,
            ),
            h30,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                width: size.width,
                child: Text(
                  textAlign: TextAlign.start,
                  'Getting Started !',
                  style: appTheme.textTheme.titleLarge,
                ),
              ),
            ),
            h20,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFieldAuthentication(
                      prefixIcon: Icons.email_outlined,
                      controller: emailController,
                      hintText: 'abc@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                    ),
                    h10,
                    PasswordAuthentication(
                        voidCallback: () {
                          context
                              .read<PasswordVisibilityCubit>()
                              .toggleVisibility();
                        },
                        prefixIcon: Icons.password,
                        controller: passwordController,
                        validator: validatePassword,
                        hintText: 'Password',
                        keyboardType: TextInputType.text),
                    h20,
                    GestureDetector(
                      onTap: () => context.push(RouterConstants.forgotPassword),
                      child: Text(
                        'Forgot Password?',
                        style: appTheme.textTheme.displaySmall,
                      ),
                    ),
                    h20,
                    AppThemeButton(
                        voidCallback: () async {
                          if (formKey.currentState!.validate()) {
                            onSigninButtonClicked();
                          }
                        },
                        buttonText: 'Sign In',
                        size: size),
                  ],
                ),
              ),
            ),
            h20,
            Text(
              textAlign: TextAlign.center,
              'Or Continue with',
              style: appTheme.textTheme.bodyLarge,
            ),
            h20,
            InkWell(
              onTap: () {
                onGoogleButtonClicked();
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  googleLogo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?',
                    style: appTheme.textTheme.bodyLarge),
                w10,
                InkWell(
                  onTap: () => context.push(RouterConstants.signUpScreen),
                  child: Text(
                    'Sign Up',
                    style: appTheme.textTheme.displaySmall,
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

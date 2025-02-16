import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

import '../widgets/vibette_logo.dart';

class SignInScreenMobile extends StatefulWidget {
  const SignInScreenMobile(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey,
      required this.size});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final Size size;

  @override
  State<SignInScreenMobile> createState() => _SignInScreenMobileState();
}

class _SignInScreenMobileState extends State<SignInScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            h40,
            const VibetteLogo(),
            Text(
              'Vibette',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            h30,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                width: widget.size.width,
                child: Text(
                  textAlign: TextAlign.start,
                  'Getting Started !',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            h20,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFieldAuthentication(
                      prefixIcon: Icons.email_outlined,
                      controller: widget.emailController,
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
                        controller: widget.passwordController,
                        validator: validatePassword,
                        hintText: 'Password',
                        keyboardType: TextInputType.text),
                    h20,
                    GestureDetector(
                      onTap: () => context.push(RouterConstants.forgotPassword),
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    h20,
                    AppThemeButton(
                        voidCallback: () async {
                          //if (formKey.currentState!.validate()) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', true);
                          context.goNamed(RouterConstants.basePage);
                          //  }
                        },
                        buttonText: 'Sign In',
                        size: widget.size),
                  ],
                ),
              ),
            ),
            h20,
            Text(
              textAlign: TextAlign.center,
              'Or Continue with',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            h20,
            InkWell(
              onTap: () {},
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
                    style: Theme.of(context).textTheme.bodyLarge),
                w10,
                InkWell(
                  onTap: () => context.push(RouterConstants.signUpScreen),
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.displaySmall,
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

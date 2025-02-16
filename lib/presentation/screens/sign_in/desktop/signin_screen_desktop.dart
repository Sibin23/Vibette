import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/custom_outline_button.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

class SigninScreenDesktop extends StatefulWidget {
  const SigninScreenDesktop(
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
  State<SigninScreenDesktop> createState() => _SigninScreenDesktopState();
}

class _SigninScreenDesktopState extends State<SigninScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.amber,
                width: widget.size.width * 0.2,
                height: widget.size.height * 0.8,
              ),
              Container(
                width: widget.size.width * 0.5,
                child: Column(
                  children: [
                    h40,
                    const VibetteLogo(),
                    Text(
                      'Vibette',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.diphylleia(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? black
                                  : white,
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                    h30,
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: widget.size.width,
                        child: Text(
                          textAlign: TextAlign.start,
                          'Getting Started !',
                          style: Theme.of(context).brightness == Brightness.dark
                              ? titleTextWhite
                              : titleTextBlack,
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
                              onTap: () =>
                                  context.push(RouterConstants.forgotPassword),
                              child: Text(
                                'Forgot Password?',
                                style: appThemeText,
                              ),
                            ),
                            h20,
                            CustomOutlineButton(text: 'Sign In', onTap: () {})
                            // AppThemeButton(
                            //     voidCallback: () async {
                            //       //if (formKey.currentState!.validate()) {
                            //       SharedPreferences prefs =
                            //           await SharedPreferences.getInstance();
                            //       await prefs.setBool('isLoggedIn', true);
                            //       context.goNamed(RouterConstants.basePage);
                            //       //  }
                            //     },
                            //     buttonText: 'Sign In',
                            //     size: widget.size),
                          ],
                        ),
                      ),
                    ),
                    h20,
                    Text(
                      textAlign: TextAlign.center,
                      'Or Continue with',
                      style: Theme.of(context).brightness == Brightness.dark
                          ? subtitleNormalW
                          : subtitleNormalB,
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
                            style:
                                Theme.of(context).brightness == Brightness.dark
                                    ? subtitleNormalW
                                    : subtitleNormalB),
                        w10,
                        InkWell(
                          onTap: () =>
                              context.push(RouterConstants.SignUpScreen),
                          child: Text(
                            'Sign Up',
                            style: appThemeText,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

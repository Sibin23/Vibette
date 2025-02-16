import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

class SigninScreenTablet extends StatelessWidget {
  const SigninScreenTablet(
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: size.width * 0.8,
            child: Column(
              children: [
                h60,
                const VibetteLogo(),
                Text(
                  'Vibette',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.diphylleia(
                      color: Theme.of(context).brightness == Brightness.light
                          ? black
                          : white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
                h30,
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: size.width,
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
                          onTap: () =>
                              context.push(RouterConstants.forgotPassword),
                          child: Text(
                            'Forgot Password?',
                            style: appThemeText,
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
                            size: size),
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
                        style: Theme.of(context).brightness == Brightness.dark
                            ? subtitleNormalW
                            : subtitleNormalB),
                    w10,
                    InkWell(
                      onTap: () => context.push(RouterConstants.SignUpScreen),
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
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

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
      backgroundColor: appTheme(context),
      appBar: AppBar(
        backgroundColor: appTheme(context),
        centerTitle: true,
        title: Text(
          'Reset Password',
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
                  PasswordAuthentication(
                    prefixIcon: Icons.password_rounded,
                    controller: passwordController,
                    validator: validatePassword,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    voidCallback: () => context
                        .read<PasswordVisibilityCubit>()
                        .toggleVisibility(),
                  ),
                  h10,
                  ConfirmPasswordAuthentication(
                    prefixIcon: Icons.password_rounded,
                    controller: confirmPasswordController,
                    validator: validatePassword,
                    hintText: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                    voidCallback: () => context
                        .read<ConfirmPasswordVisibilityCubit>()
                        .toggleVisibility(),
                  ),
                  h30,
                  AppThemeButton(
                      size: size,
                      voidCallback: () {
                        //if (formKey.currentState!.validate()) {
                        context.goNamed(RouterConstants.signIn);
                        //  }
                      },
                      buttonText: 'Confirm'),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

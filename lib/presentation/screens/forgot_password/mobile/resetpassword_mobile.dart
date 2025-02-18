import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

class ResetpasswordMobileScreen extends StatelessWidget {
  const ResetpasswordMobileScreen(
      {super.key,
      required this.formkey,
      required this.size,
      required this.password,
      required this.confirmPassword,
      required this.voidCallback});
  final GlobalKey<FormState> formkey;
  final Size size;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      controller: password,
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
                      controller: confirmPassword,
                      validator: validatePassword,
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      voidCallback: () => context
                          .read<ConfirmPasswordVisibilityCubit>()
                          .toggleVisibility(),
                    ),
                    h40,
                    AppThemeButton(
                        size: size,
                        voidCallback: voidCallback,
                        buttonText: 'Confirm')
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

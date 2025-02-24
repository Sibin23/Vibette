import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_snackbar.dart';
import 'package:vibette/presentation/screens/widgets/loading_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

class ResetpasswordMobileScreen extends StatelessWidget {
  const ResetpasswordMobileScreen(
      {super.key,
      required this.formkey,
      required this.size,
      required this.password,
      required this.confirmPassword,
      required this.email});
  final GlobalKey<FormState> formkey;
  final Size size;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final String email;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          CustomSnackBar.show(
            context,
            'Pasword Changed Successfully',
            green,
            duration: const Duration(seconds: 1),
            onPressed: () => context.goNamed(RouterConstants.signIn),
          );
        } else if (state is ResetPasswordFailure) {
          CustomSnackBar.show(context, state.message, orange,
              duration: const Duration(seconds: 1));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Reset Password',
              style: theme.textTheme.titleLarge,
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
                      style: theme.textTheme.displayLarge,
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
                              style: theme.textTheme.bodyLarge,
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
                            state is ResetPasswordLoading
                                ? LoadingButton(size: size)
                                : AppThemeButton(
                                    size: size,
                                    voidCallback: () {
                                      validate(context);
                                    },
                                    buttonText: 'Confirm')
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }

  validate(BuildContext context) {
    if (password.text.trim() == confirmPassword.text.trim()) {
      if (formkey.currentState!.validate()) {
        context
            .read<ResetPasswordBloc>()
            .add(OnConfirmButtonClickEvent(email, password.text.trim()));
      }
    } else {
      CustomSnackBar.show(context, 'Password doesn\'t match', orange,
          duration: const Duration(seconds: 1));
    }
  }
}

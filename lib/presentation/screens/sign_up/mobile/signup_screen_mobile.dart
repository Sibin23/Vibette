import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_snackbar.dart';
import 'package:vibette/presentation/screens/widgets/loading_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

import '../../sign_in/widgets/vibette_logo.dart';

class SignUpScreenMobile extends StatelessWidget {
  const SignUpScreenMobile(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.phoneController,
      required this.size,
      required this.formkey});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final Size size;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<SignUpBloc, SignUpState>(listener: (context, state) {
      if (state is SignUpSuccess) {
        CustomSnackBar.show(
          context,
          'OTP sent to ${emailController.text.trim()}',
          green,
          duration: const Duration(seconds: 1),
          onPressed: () {
            context.pushNamed(
              RouterConstants.signUpOtp,
              extra: state.user,
            );
          },
        );
      } else if (state is SignUpFailure) {
        CustomSnackBar.show(context, state.message, orange);
      }
    }, child: BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              child: ListView(
                children: [
                  h20,
                  const VibetteLogo(),
                  Text('Vibette',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayLarge),
                  h20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Welcome !',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Please create your account here.',
                        style: theme.textTheme.bodyLarge),
                  ),
                  h10,
                  Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextFieldAuthentication(
                              prefixIcon: Icons.person,
                              controller: nameController,
                              validator: validateUsername,
                              hintText: 'First Name',
                              keyboardType: TextInputType.emailAddress),
                          h10,
                          TextFieldAuthentication(
                              prefixIcon: Icons.email_outlined,
                              controller: emailController,
                              validator: validateEmail,
                              hintText: 'abc@gmail.com',
                              keyboardType: TextInputType.emailAddress),
                          h10,
                          TextFieldAuthentication(
                              prefixIcon: Icons.call,
                              controller: phoneController,
                              validator: validateMobileNumber,
                              hintText: '1234567890',
                              keyboardType: TextInputType.number),
                          h10,
                          PasswordAuthentication(
                              prefixIcon: Icons.password_rounded,
                              controller: passwordController,
                              validator: validatePassword,
                              hintText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              voidCallback: () => context
                                  .read<PasswordVisibilityCubit>()
                                  .toggleVisibility()),
                          h10,
                          ConfirmPasswordAuthentication(
                              prefixIcon: Icons.password_rounded,
                              controller: confirmPasswordController,
                              validator: validatePassword,
                              hintText: 'Confirm Password',
                              keyboardType: TextInputType.visiblePassword,
                              voidCallback: () => context
                                  .read<ConfirmPasswordVisibilityCubit>()
                                  .toggleVisibility()),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: state is SignUpLoading
                        ? LoadingButton(size: size)
                        : AppThemeButton(
                            size: size,
                            voidCallback: () {
                              _validate(context);
                            },
                            buttonText: 'Sign Up'),
                  ),
                  h10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                          style: theme.textTheme.bodyLarge),
                      w10,
                      InkWell(
                        onTap: () => context.pop(),
                        child: Text(
                          'Sign In',
                          style: theme.textTheme.displaySmall,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
        );
      },
    ));
  }

  void _validate(BuildContext context) {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      if (formkey.currentState!.validate()) {
        context.read<SignUpBloc>().add(SignUpButtonClickEvent(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              phoneNumber: phoneController.text.trim(),
              password: passwordController.text.trim(),
            ));
      }
    } else {
      CustomSnackBar.show(context, 'Password doesn\'t match', orange,
          duration: const Duration(seconds: 2));
    }
  }
}

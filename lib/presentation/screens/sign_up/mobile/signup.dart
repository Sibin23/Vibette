import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
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
      required this.size});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
          child: ListView(
        children: [
          h20,
          const VibetteLogo(),
          Text('Vibette',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge),
          h20,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Welcome !',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Please create your account here.',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          h10,
          Padding(
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AppThemeButton(
                size: size, voidCallback: () {}, buttonText: 'Sign Up'),
          ),
          h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?',
                  style: Theme.of(context).textTheme.bodyLarge),
              w10,
              InkWell(
                onTap: () => context.pop(),
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}

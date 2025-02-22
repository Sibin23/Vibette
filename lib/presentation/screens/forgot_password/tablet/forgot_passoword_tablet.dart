import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_snackbar.dart';
import 'package:vibette/presentation/screens/widgets/loading_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

class ForgotPassowordTablet extends StatelessWidget {
  const ForgotPassowordTablet(
      {super.key,
      required this.size,
      required this.email,
      required this.formkey});
  final Size size;
  final TextEditingController email;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          context
              .push('${RouterConstants.otpVerification}/${email.text.trim()}');
        } else if (state is ForgotPasswordFailure) {
          CustomSnackBar.show(context, state.message, orange,
              duration: const Duration(seconds: 1));
        }
      },
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
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
                child: Center(
              child: SizedBox(
                width: size.width * 0.6,
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
                        key: formkey,
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
                            state is ForgotPasswordLoading
                                ? LoadingButton(size: size)
                                : AppThemeButton(
                                    size: size,
                                    voidCallback: () {
                                      if (formkey.currentState!.validate()) {
                                        context.read<ForgotPasswordBloc>().add(
                                            OnGetOTPbuttonClickEvent(
                                                email: email.text.trim()));
                                      }
                                    },
                                    buttonText: 'Get OTP'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}

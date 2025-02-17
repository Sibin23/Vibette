import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/custom_outline_button.dart';
import 'package:vibette/presentation/screens/widgets/textfield_authentication.dart';
import 'package:vibette/presentation/screens/widgets/validators.dart';

class ForgotPasswordDesktop extends StatelessWidget {
  final Size size;
  final TextEditingController email;
  final GlobalKey<FormState> formKey;
  const ForgotPasswordDesktop(
      {super.key,
      required this.size,
      required this.email,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
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
          width: size.width * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              h30,
              const VibetteLogo(),
              Text(
                'Vibette',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              h50,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 100, right: 100, top: 10, bottom: 10),
                        child: CustomOutlineButton(
                            size: size, text: 'Get OTP', onTap: () {
                               context.push(RouterConstants.otpVerification);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

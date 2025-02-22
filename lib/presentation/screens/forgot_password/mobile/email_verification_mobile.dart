import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/email_verification_bloc/email_verification_bloc.dart';
import 'package:vibette/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:vibette/presentation/screens/forgot_password/widgets/email_verification_section1.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_snackbar.dart';
import 'package:vibette/presentation/screens/widgets/loading_button.dart';

class EmailVerificationMobile extends StatefulWidget {
  const EmailVerificationMobile(
      {super.key, required this.size, required this.email});
  final Size size;
  final String email;

  @override
  State<EmailVerificationMobile> createState() =>
      _EmailVerificationMobileState();
}

class _EmailVerificationMobileState extends State<EmailVerificationMobile> {
  late Timer _timer;
  Timer? _debounceTimer;
  String otp = '';
  int _start = 60;
  bool _isResendVisible = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _isResendVisible = false;
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isResendVisible = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void debounceResendOtp(ForgotPasswordBloc forgotPasswordBloc) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      forgotPasswordBloc.add(OnGetOTPbuttonClickEvent(email: widget.email));
      startTimer(); // Restart the timer
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<EmailVerificationBloc, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          CustomSnackBar.show(
            context,
            'Email Verfied Successfylly !',
            green,
            duration: const Duration(seconds: 1),
            onPressed: () {
              context.push(RouterConstants.resetPassword);
            },
          );
        } else if (state is EmailVerificationFailure) {
          CustomSnackBar.show(context, 'Email Verification Failed', red,
              duration: const Duration(seconds: 1));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                EmailVerificationSection1(
                    size: widget.size, theme: theme, email: widget.email),
                OtpTextField(
                  fieldWidth: 60,
                  fieldHeight: 70,
                  focusedBorderColor: grey,
                  numberOfFields: 4,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).brightness == Brightness.dark
                      ? white
                      : grey,
                  borderColor: grey,
                  enabledBorderColor: appThemeColor2,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    otp = verificationCode;
                  },
                ),
                h20,
                BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
                  builder: (context, state) {
                    return state is EmailVerificationLoading
                        ? LoadingButton(size: widget.size)
                        : AppThemeButton(
                            size: widget.size,
                            voidCallback: () {
                              if (otp.length == 4) {
                                context.read<EmailVerificationBloc>().add(
                                    OnVerificationButtonClickEvent(
                                        verificationCode: otp,
                                        email: widget.email));
                              }
                            },
                            buttonText: 'Verify');
                  },
                ),
                h10,
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't get the code?",
                      ),
                      SizedBox(
                        width: widget.size.height * 0.015,
                      ),
                    ],
                  ),
                ),
                _isResendVisible
                    ? TextButton(
                        onPressed: () {
                          debounceResendOtp(ForgotPasswordBloc());
                        },
                        child: Text(
                          'Resend OTP',
                          style: theme.textTheme.displaySmall,
                        ),
                      )
                    : Text(
                        'Resend OTP in $_start seconds',
                        style: theme.textTheme.displaySmall,
                      ),
              ],
            ),
          )),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/screens/forgot_password/widgets/email_verification_section1.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';

class EmailVerificationMobile extends StatefulWidget {
  const EmailVerificationMobile({super.key, required this.size});
  final Size size;

  @override
  State<EmailVerificationMobile> createState() =>
      _EmailVerificationMobileState();
}

class _EmailVerificationMobileState extends State<EmailVerificationMobile> {
  late Timer _timer;
  Timer? _debounceTimer;
  String otp = '';
  int _start = 60;
  bool isResendVisible = false;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _debounceTimer?.cancel();

    super.dispose();
  }

  void startTimer() {
    isResendVisible = false;
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          isResendVisible = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void debounceResendOtp() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      //  context.read<SignUpScreenBloc>().add(SignUpScreenButtenClickEvent(user: widget.user));
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                    children: [
            EmailVerificationSection1(size: widget.size),
            OtpTextField(
              fieldWidth: 60,
              fieldHeight: 70,
              focusedBorderColor: grey,
              numberOfFields: 4,
              keyboardType: TextInputType.number,
              cursorColor:
                  Theme.of(context).brightness == Brightness.dark ? white : grey,
              borderColor: grey,
              enabledBorderColor: appThemeColor2,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                otp = verificationCode;
              },
            ),
            h20,
            AppThemeButton(
                size: widget.size,
                voidCallback: () {
                  if (otp.length == 4) {
                    context.push(RouterConstants.resetPassword);
                  }
                },
                buttonText: 'Verify')
                    ],
                  ),
          )),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';

import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';

class GetOTPScreen extends StatefulWidget {
  const GetOTPScreen({super.key});

  @override
  State<GetOTPScreen> createState() => _GetOTPScreenState();
}

class _GetOTPScreenState extends State<GetOTPScreen> {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appTheme(context),
      appBar: AppBar(
        backgroundColor: appTheme(context),
        centerTitle: true,
        title: Text(
          'Email Verification',
          style: Theme.of(context).brightness == Brightness.dark
              ? title2W
              : title2B,
        ),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SafeArea(
          child: ListView(children: [
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
        h20,
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Verification Code',
            style: Theme.of(context).brightness == Brightness.dark
                ? titleTextWhite
                : titleTextBlack,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'Please enter the 4 digit code that send to your email address.',
                style: Theme.of(context).brightness == Brightness.dark
                    ? subtitleNormalW
                    : subtitleNormalB,
              ),
              h10,
              OtpTextField(
                fieldWidth: 60,
                fieldHeight: 70,
                focusedBorderColor: grey,
                numberOfFields: 4,
                borderColor: grey,
                enabledBorderColor: appThemePrimary,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  otp = verificationCode;
                },
              ),
              h20,
              AppThemeButton(
                  size: size,
                  voidCallback: () {
                    if (otp.length == 4) {
                      context.push(RouterConstants.resetPassword);
                    }
                  },
                  buttonText: 'Verify')
            ],
          ),
        ),
      ])),
    );
  }
}

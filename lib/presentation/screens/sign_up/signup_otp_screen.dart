import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/domain/models/user/user_model.dart';
import 'package:vibette/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:vibette/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:vibette/presentation/bloc/sign_up_otp_bloc/sign_up_otp_bloc.dart';
import 'package:vibette/presentation/screens/responsive/widget_layout.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_snackbar.dart';
import 'package:vibette/presentation/screens/widgets/loading_button.dart';

class SignupOtpScreen extends StatefulWidget {
  final UserModel user;
  final String email;

  const SignupOtpScreen({
    super.key,
    required this.email,
    required this.user,
  });

  @override
  State<SignupOtpScreen> createState() => _SignupOtpScreenState();
}

class _SignupOtpScreenState extends State<SignupOtpScreen> {
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

  void debounceResendOtp(SignUpBloc signUpBloc) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      signUpBloc.add(SignUpButtonClickEvent(
          name: widget.user.userName,
          password: widget.user.password,
          phoneNumber: widget.user.phoneNumber,
          email: widget.user.emailId));
      startTimer(); // Restart the timer
    });
  }

  bool validateOtp() {
    debugPrint('OTP from PinCodeTextField: $otp');
    if (otp.length == 4 && RegExp(r'^[0-9]{4}$').hasMatch(otp)) {
      return true;
    } else {
      debugPrint(
          'Validation failed: OTP is either not 4 digits or contains non-numeric characters');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final signUpBloc = context.read<SignUpBloc>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Scaffold(
      backgroundColor: black,
      body: BlocConsumer<SignUpOtpBloc, SignUpOtpState>(
        listener: (context, state) {
          if (state is SignUpOtpSuccess) {
            CustomSnackBar.show(context, "OTP verification success", green);
          } else if (state is SignUpOtpFailure) {
            CustomSnackBar.show(context, "Invalid OTP", Colors.red);
          }
        },
        builder: (context, state) {
          return WidgetLayout(
            size: size,
            minwidth: 300,
            tabletwidth: size.width,
            desktopwidth: 600,
            tabletCondition: size.width > 600 && size.width < 1024,
            widget: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.06,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                              Positioned(
                                left:
                                    MediaQuery.of(context).size.width * 0.03,
                                top: MediaQuery.of(context).size.height *
                                    0.035,
                                child: Image.asset(
                                  'assets/otpsent.webp',
                                  width: MediaQuery.of(context).size.width *
                                      0.35,
                                  height: MediaQuery.of(context).size.height *
                                      0.15,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Enter the verification code that was sent to ",
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            widget.email,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      OtpTextField(
                        fieldWidth: 60,
                        fieldHeight: 70,
                        focusedBorderColor: grey,
                        numberOfFields: 4,
                        keyboardType: TextInputType.number,
                        cursorColor:
                            Theme.of(context).brightness == Brightness.dark
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
                      SizedBox(
                        height: height * 0.04,
                      ),
                      BlocBuilder<SignUpOtpBloc, SignUpOtpState>(
                        builder: (context, state) {
                          if (state is SignInLoading) {
                            return LoadingButton(
                              size: size,
                            );
                          }
                          return AppThemeButton(
                            buttonText: "Verify",
                            size: size,
                            voidCallback: () async {
                              if (validateOtp()) {
                                debugPrint('Entered OTP: $otp');
                                context.read<SignUpOtpBloc>().add(
                                    OnOtpVerificationButtonClickedEvent(
                                        otp: otp, email: widget.email));
                              } else {
                                debugPrint('Invalid OTP: $otp');
                                CustomSnackBar.show(
                                    context,
                                    'Please enter a valid 4-digit OTP',
                                    Colors.red);
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Didn't get the code?",
                            ),
                            SizedBox(
                              width: height * 0.015,
                            ),
                          ],
                        ),
                      ),
                      _isResendVisible
                          ? TextButton(
                              onPressed: () {
                                debounceResendOtp(signUpBloc);
                              },
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(color: white, fontSize: 16),
                              ),
                            )
                          : Text(
                              'Resend OTP in $_start seconds',
                              style:
                                  const TextStyle(color: green, fontSize: 16),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

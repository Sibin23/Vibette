import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/domain/models/user/user_model.dart';
import 'package:vibette/presentation/bloc/cubit/timer_cubit/timer_cubit.dart';
import 'package:vibette/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:vibette/presentation/bloc/sign_up_otp_bloc/sign_up_otp_bloc.dart';
import 'package:vibette/presentation/screens/responsive/widget_layout.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_loading_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_outline_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_snackbar.dart';
import 'package:vibette/presentation/screens/widgets/loading_button.dart';

class SignupOtpScreen extends StatefulWidget {
  final UserModel user;

  const SignupOtpScreen({
    super.key,
    required this.user,
  });

  @override
  State<SignupOtpScreen> createState() => _SignupOtpScreenState();
}

class _SignupOtpScreenState extends State<SignupOtpScreen> {
  String otp = '';
  @override
  void initState() {
    context.read<TimerCubit>().startTimer();
    super.initState();
  }

  bool validateOtp() {
    if (otp.length == 4 && RegExp(r'^[0-9]{4}$').hasMatch(otp)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Scaffold(
      backgroundColor: black,
      body: BlocConsumer<SignUpOtpBloc, SignUpOtpState>(
        listener: (context, state) {
          if (state is SignUpOtpSuccess) {
            CustomSnackBar.show(
              context,
              "OTP verification success",
              green,
              duration: const Duration(seconds: 1),
              onPressed: () => context.goNamed(RouterConstants.signIn),
            );
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
                      Container(
                          alignment: Alignment.center,
                          width: size.width,
                          height: 200,
                          child: Image.asset(
                            'assets/otpsent.webp',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Enter the verification code that was sent to ",
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            widget.user.emailId,
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
                            return size.width > 1024
                                ? CustomLoadingButton(size: size)
                                : LoadingButton(
                                    size: size,
                                  );
                          }
                          return size.width > 1024
                              ? CustomOutlineButton(
                                  size: size,
                                  text: 'Verify',
                                  onTap: () {
                                    validate();
                                  })
                              : SizedBox(
                                  width: size.width > 600 && size.width < 1024
                                      ? size.width * 0.6
                                      : size.width,
                                  child: AppThemeButton(
                                    buttonText: "Verify",
                                    size: size,
                                    voidCallback: () {
                                      validate();
                                    },
                                  ),
                                );
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      BlocBuilder<TimerCubit, TimerState>(
                        builder: (context, state) {
                          if (state is TimerProgress) {
                            return Text(
                              'Resend OTP in ${60 - state.elapsed} seconds',
                              style:
                                  const TextStyle(color: green, fontSize: 16),
                            );
                          } else if (state is TimerInitial) {
                            return TextButton(
                              onPressed: () {
                                context.read<SignUpOtpBloc>().add(
                                    OnResendOTPButtonclickedEvent(widget.user));
                                context
                                    .read<TimerCubit>()
                                    .startTimer(); // Start timer for 30 seconds
                              },
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(color: white, fontSize: 16),
                              ),
                            );
                          } else {
                            return const Text('');
                          }
                        },
                      )
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

  void validate() {
    if (validateOtp()) {
      debugPrint('Entered OTP: $otp');
      context.read<SignUpOtpBloc>().add(OnOtpVerificationButtonClickedEvent(
          otp: otp, email: widget.user.emailId));
    } else {
      debugPrint('Invalid OTP: $otp');
      CustomSnackBar.show(
          context, 'Please enter a valid 4-digit OTP', Colors.red);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/cubit/timer_cubit/timer_cubit.dart';
import 'package:vibette/presentation/bloc/email_verification_bloc/email_verification_bloc.dart';
import 'package:vibette/presentation/screens/forgot_password/widgets/email_verification_section1.dart';
import 'package:vibette/presentation/screens/widgets/apptheme_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_snackbar.dart';
import 'package:vibette/presentation/screens/widgets/loading_button.dart';

class EmailVerificationTablet extends StatefulWidget {
  const EmailVerificationTablet(
      {super.key, required this.size, required this.email});
  final Size size;
  final String email;

  @override
  State<EmailVerificationTablet> createState() =>
      _EmailVerificationTabletState();
}

class _EmailVerificationTabletState extends State<EmailVerificationTablet> {
  String otp = '';

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
          onPressed: () =>
           context.pushNamed('${RouterConstants.resetPassword}/${widget.email}'),
        );
      } else if (state is EmailVerificationFailure) {
        CustomSnackBar.show(context, state.message, orange,
            duration: const Duration(seconds: 1));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: widget.size.width * 0.5,
              child: Column(
                children: [
                  EmailVerificationSection1(
                    size: widget.size,
                    theme: theme,
                    email: widget.email,
                  ),
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
                    onCodeChanged: (String code) {
                      otp = code;
                    },
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
                                validate();
                              },
                              buttonText: 'Verify');
                    },
                  ),
                  h20,
                  BlocBuilder<TimerCubit, TimerState>(
                    builder: (context, state) {
                      if (state is TimerProgress) {
                        return Text(
                          'Resend OTP in ${60 - state.elapsed} seconds',
                          style: const TextStyle(color: green, fontSize: 16),
                        );
                      } else if (state is TimerInitial) {
                        return TextButton(
                          onPressed: () {
                            context.read<EmailVerificationBloc>().add(
                                OnResedOtpButtonClickedEvent(widget.email));
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
    });
  }

  bool validateOtp() {
    if (otp.length == 4 && RegExp(r'^[0-9]{4}$').hasMatch(otp)) {
      return true;
    } else {
      return false;
    }
  }

  void validate() {
    if (validateOtp()) {
      debugPrint('Entered OTP: $otp');
      context.read<EmailVerificationBloc>().add(OnVerificationButtonClickEvent(
          email: widget.email, verificationCode: otp));
    } else {
      debugPrint('Invalid OTP: $otp');
      CustomSnackBar.show(
          context, 'Please enter a valid 4-digit OTP', Colors.red);
    }
  }
}

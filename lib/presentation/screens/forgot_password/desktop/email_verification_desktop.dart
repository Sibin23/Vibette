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
import 'package:vibette/presentation/screens/widgets/custom_loading_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_outline_button.dart';
import 'package:vibette/presentation/screens/widgets/custom_snackbar.dart';

class EmailVerificationDesktop extends StatefulWidget {
  const EmailVerificationDesktop(
      {super.key, required this.size, required this.email});
  final Size size;
  final String email;

  @override
  State<EmailVerificationDesktop> createState() =>
      _EmailVerificationDesktopState();
}

class _EmailVerificationDesktopState extends State<EmailVerificationDesktop> {
  String otp = '';
  @override
  void initState() {
    context.read<TimerCubit>().startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<EmailVerificationBloc, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          CustomSnackBar.show(
            context,
            'Email Verified Successfully !',
            green,
            duration: const Duration(seconds: 1),
            onPressed: () => context
                .pushNamed('${RouterConstants.resetPassword}/${widget.email}'),
          );
        } else if (state is EmailVerificationFailure) {
          CustomSnackBar.show(context, state.message, red,
              duration: const Duration(seconds: 1));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Email Verrification',
                style: Theme.of(context).textTheme.titleLarge),
            leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          ),
          body: SafeArea(
              child: Center(
            child: SizedBox(
              width: widget.size.width * 0.4,
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
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      otp = verificationCode;
                    },
                  ),
                  BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
                    builder: (context, state) {
                      return state is EmailVerificationLoading
                          ? CustomLoadingButton(size: widget.size)
                          : CustomOutlineButton(
                              size: widget.size,
                              onTap: () {
                                validate();
                              },
                              text: 'Verify');
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
                            context.read<TimerCubit>().startTimer();
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
          )),
        );
      },
    );
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

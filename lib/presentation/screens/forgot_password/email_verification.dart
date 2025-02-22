import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/forgot_password/desktop/email_verification_desktop.dart';
import 'package:vibette/presentation/screens/forgot_password/mobile/email_verification_mobile.dart';
import 'package:vibette/presentation/screens/forgot_password/tablet/email_verification_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class EmailVerification extends StatefulWidget {
  final String email;
  const EmailVerification({super.key, required this.email});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.email);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppLayout(
          mobileLayout:
              EmailVerificationMobile(size: size, email: widget.email),
          tabletLayout:
              EmailVerificationTablet(size: size, email: widget.email),
          desktopLayout: EmailVerificationDesktop(
            size: size,
            email: widget.email,
          )),
    );
  }
}

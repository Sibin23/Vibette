import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/forgot_password/desktop/email_verification_desktop.dart';
import 'package:vibette/presentation/screens/forgot_password/mobile/email_verification_mobile.dart';
import 'package:vibette/presentation/screens/forgot_password/tablet/email_verification_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class GetOTPScreen extends StatefulWidget {
  const GetOTPScreen({super.key});

  @override
  State<GetOTPScreen> createState() => _GetOTPScreenState();
}

class _GetOTPScreenState extends State<GetOTPScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppLayout(
          mobileLayout: EmailVerificationMobile(size: size),
          tabletLayout: EmailVerificationTablet(size: size),
          desktopLayout: EmailVerificationDesktop(size: size)),
    );
  }
}

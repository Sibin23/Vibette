import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/presentation/screens/forgot_password/email_verification.dart';
import 'package:vibette/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:vibette/presentation/screens/home_screen/home_screen.dart';
import 'package:vibette/presentation/screens/login_screen/login_screen.dart';
import 'package:vibette/presentation/screens/sign_up/signUp.dart';
import 'package:vibette/presentation/screens/splash_screen/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const CupertinoPage(child: SplashScreen());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'SignIn',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const CupertinoPage(child: LoginScreen());
          },
        ),
        GoRoute(
          path: 'SignUp',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const CupertinoPage(child: SignUp());
          },
        ),
        GoRoute(
          path: 'ForgotPassword',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const CupertinoPage(child: ForgotPasswordScreen());
          },
        ),
        GoRoute(
          path: 'OTPVerification',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const CupertinoPage(child: GetOTPScreen());
          },
        ),
        GoRoute(
          path: 'HomeScreen',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const CupertinoPage(child: HomeScreen());
          },
        ),
      ],
    ),
    // GoRoute(
    //   path: '/profile',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return ProfileScreen();
    //   },
    // ),
  ],
);

// CustomTransitionBuilder platformAwareTransitionBuilder() {
//   return (context, animation, secondaryAnimation, child) {
//     if (kIsIOS) {
//       return CupertinoPageTransitionsBuilder().buildTransitions(
//         null, context, animation, secondaryAnimation, child,
//       );
//     } else {
//       return FadeTransition(
//         opacity: animation,
//         child: child,
//       );
//     }
//   };
// }
// class CupertinoPage {
//   CupertinoPage({required this.child});

//   final Widget child;

//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     return CupertinoPageRoute<void>(
//       builder: (context) => child,
//       fullscreenDialog: false,
//     ).buildTransitions(
//       null,
//       context,
//       animation,
//       secondaryAnimation,
//       child,
//     );
//   }
// }

// Screens

const String splashScreen = '/SplashScreen';
const String signIn = '/SignIn';
const String signUp = '/SignUp';
const String forgotPassword = '/ForgotPassword';
const String otpVerification = '/OTPVerification';
const String homeScreen = '/HomeScreen';

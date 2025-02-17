import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/screens/add_post/add_post_screen.dart';
import 'package:vibette/presentation/screens/explore_screen/explore.dart';
import 'package:vibette/presentation/screens/forgot_password/email_verification.dart';
import 'package:vibette/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:vibette/presentation/screens/forgot_password/reset_password_screen.dart';
import 'package:vibette/presentation/screens/home_screen/home_screen.dart';
import 'package:vibette/presentation/screens/main_wrapper/main_wrapper.dart';
import 'package:vibette/presentation/screens/profile/profile_screen.dart';
import 'package:vibette/presentation/screens/sign_in/signin_screen.dart';
import 'package:vibette/presentation/screens/sign_up/signup_screen.dart';
import 'package:vibette/presentation/screens/splash_screen/splash_screen.dart';



class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: RouterConstants.splashScreen,
    routes: <RouteBase>[
      GoRoute(
        path: RouterConstants.splashScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CupertinoPage(child: SplashScreen());
        },
      ),
      GoRoute(
        name: RouterConstants.signIn,
        path: RouterConstants.signIn,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CupertinoPage(child: SigninScreen());
        },
      ),
      GoRoute(
        name: RouterConstants.signUpScreen,
        path: RouterConstants.signUpScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CupertinoPage(child: SignupScreen());
        },
      ),
      GoRoute(
        name: RouterConstants.forgotPassword,
        path: RouterConstants.forgotPassword,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CupertinoPage(child: ForgotPasswordScreen());
        },
      ),
      GoRoute(
        name: RouterConstants.otpVerification,
        path: RouterConstants.otpVerification,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CupertinoPage(child: GetOTPScreen());
        },
      ),
      GoRoute(
        name: RouterConstants.resetPassword,
        path: RouterConstants.resetPassword,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CupertinoPage(child: ResetPasswordScreen());
        },
      ),
      GoRoute(
        name: RouterConstants.basePage,
        path: RouterConstants.basePage,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return  const CupertinoPage(child: MainWrapper());
        },
      ),
       GoRoute(
      name: RouterConstants.homeScreen,
      path: RouterConstants.homeScreen,
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()), // Use MaterialPage
    ),
    GoRoute(
      name: RouterConstants.explore,
      path: RouterConstants.explore,
      pageBuilder: (context, state) => const MaterialPage(child: ExploreScreen()), // Use MaterialPage
    ),
    GoRoute(
      name: RouterConstants.addpost,
      path: RouterConstants.addpost,
      pageBuilder: (context, state) => const MaterialPage(child: AddPostScreen()), // Use MaterialPage
    ),
    GoRoute(
      name: RouterConstants.profile,
      path: RouterConstants.profile,
      pageBuilder: (context, state) => const MaterialPage(child: ProfileScreen()), // Use MaterialPage
    ),
    // GoRoute(
    //   name: RouterConstants.profile,
    //   path: RouterConstants.profile,
    //   pageBuilder: (context, state) => const MaterialPage(child: ProfileScreen()), // Use MaterialPage
    // ),
    ],
  );
}

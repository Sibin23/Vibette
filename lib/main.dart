import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/router.dart';
import 'package:vibette/domain/repository/search_repository/search_repository.dart';

import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/bloc/cubit/search_cubit/search_cubit.dart';
import 'package:vibette/presentation/bloc/cubit/timer_cubit/timer_cubit.dart';
import 'package:vibette/presentation/bloc/email_verification_bloc/email_verification_bloc.dart';
import 'package:vibette/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:vibette/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:vibette/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:vibette/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:vibette/presentation/bloc/sign_up_otp_bloc/sign_up_otp_bloc.dart';
import 'package:vibette/presentation/bloc/splash_bloc/splash_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
        ),
        BlocProvider(create: (context) => ConfirmPasswordVisibilityCubit()),
        BlocProvider(create: (context) => SearchCubit(SearchRepository())),
        BlocProvider(create: (context) => TimerCubit()),
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => SignUpOtpBloc()),
        BlocProvider(create: (context) => ForgotPasswordBloc()),
        BlocProvider(
          create: (context) => EmailVerificationBloc(),
        ),
        BlocProvider(create: (context) => ResetPasswordBloc()),
      ],
      child: MaterialApp.router(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        title: 'Vibette',
        theme: _lightTheme(),
        darkTheme: _darkTheme(),
        routerConfig: AppRouter().router,
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: white,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: black),
        surfaceTintColor: white,
        titleTextStyle:
            GoogleFonts.diphylleia(fontSize: 24, fontWeight: FontWeight.w400),
        backgroundColor: white,
      ),
      textTheme: TextTheme(
        displayLarge:
            GoogleFonts.diphylleia(fontSize: 35, fontWeight: FontWeight.w500),
        displaySmall: GoogleFonts.roboto(
            color: appThemeColor2, fontSize: 18, fontWeight: FontWeight.w500),
        titleLarge: GoogleFonts.roboto(fontSize: 28),
        titleMedium: GoogleFonts.roboto(fontSize: 22),
        bodyLarge: GoogleFonts.roboto(fontSize: 18),
        bodyMedium:
            GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.roboto(fontSize: 16),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: white,
      ),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: GoogleFonts.barlow(
            color: white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      fontFamily: GoogleFonts.roboto().fontFamily,
      useMaterial3: true,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: black,
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: black,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle:
            GoogleFonts.diphylleia(fontSize: 24, fontWeight: FontWeight.w400),
        backgroundColor: black,
      ),
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge:
            GoogleFonts.diphylleia(fontSize: 35, fontWeight: FontWeight.w500),
        displaySmall: GoogleFonts.roboto(
            color: appThemeColor2, fontSize: 18, fontWeight: FontWeight.w500),
        titleLarge: GoogleFonts.roboto(fontSize: 28),
        titleMedium: GoogleFonts.roboto(fontSize: 22),
        bodyLarge: GoogleFonts.roboto(fontSize: 18),
        bodyMedium:
            GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.roboto(fontSize: 16),
      ),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: GoogleFonts.barlow(
            color: white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}

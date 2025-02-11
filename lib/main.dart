import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/router.dart';
import 'package:vibette/domain/repository/search_repository/search_repository.dart';
import 'package:vibette/presentation/bloc/cubit/password_visibility_cubit.dart';
import 'package:vibette/presentation/bloc/cubit/search_cubit/search_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
          BlocProvider(create: (context) => SearchCubit(SearchRepository()))
        ],
        child: MaterialApp.router(
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          title: 'Vibette',
          theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: white,
              appBarTheme: const AppBarTheme(
                color: white,
                iconTheme: IconThemeData(
                  color: black,
                ),
                surfaceTintColor: white,
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 20, color: black),
              ),
              useMaterial3: true,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              )),
          darkTheme: ThemeData.dark(),
          routerConfig: AppRouter().router,
          // routeInformationParser: AppRouter().router.routeInformationParser,
          // routerDelegate: AppRouter().router.routerDelegate,
        ));
  }
}

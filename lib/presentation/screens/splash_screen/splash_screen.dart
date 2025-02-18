import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:vibette/presentation/screens/responsive/widget_layout.dart';
import 'package:vibette/presentation/screens/splash_screen/widget/splash_screen_content.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc _splashBloc; // Declare the bloc

  @override
  void initState() {
    super.initState();
    _splashBloc = context.read<SplashBloc>(); // Initialize the bloc
    _splashBloc.add(SplashStartedEvent()); // Dispatch event
    print("SplashStartedEvent added in initState");
  }

  @override
  void dispose() {
    _splashBloc.close(); // Close the bloc when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<SplashBloc>.value(
      // Use .value
      value: _splashBloc, // Provide the *existing* bloc instance
      child: BlocListener<SplashBloc, SplashState>(
          // Use BlocListener only
          listener: (context, state) {
            if (state is SplashLoaded) {
              print("SplashLoaded state received in listener");
              context.goNamed(RouterConstants.signIn);
            } else if (state is SplashError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: Scaffold(
            body: WidgetLayout(
                size: size,
                minwidth: 300,
                tabletwidth: size.width,
                desktopwidth: 600,
                tabletCondition: size.width > 600 && size.width < 1024,
                widget: SplashScreenContent(size: size)),
          ) // Separate widget
          ),
    );
  }
}



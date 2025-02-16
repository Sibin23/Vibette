import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibette/application/core/constants/router_constants.dart';
import 'package:vibette/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:vibette/presentation/screens/splash_screen/desktop/splash_screen_desktop.dart';
import 'package:vibette/presentation/screens/splash_screen/mobile/splash_screen_mobile.dart';
import 'package:vibette/presentation/screens/splash_screen/tablet/splash_screen_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

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
    return BlocProvider<SplashBloc>.value( // Use .value
      value: _splashBloc, // Provide the *existing* bloc instance
      child: BlocListener<SplashBloc, SplashState>( // Use BlocListener only
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
        child: SplashScreenContent(size: size), // Separate widget
      ),
    );
  }
}

class SplashScreenContent extends StatelessWidget {
  final Size size;

  const SplashScreenContent({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SplashBloc>().state; // Watch for state changes
    return Scaffold(
      body: AppLayout(
        mobileLayout: SplashScreenMobile(size: size, state: state),
        tabletLayout: SplashScreenTablet(size: size, state: state),
        desktopLayout: SplashScreenDesktop(size: size, state: state),
      ),
    );
  }
}
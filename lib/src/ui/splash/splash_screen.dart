import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../global_locator.dart';
import '../../services/navigation_services.dart';
import '../../theme/colors.dart';
import '../../utils/responsive.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'loading';
  const SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AuthBloc authBloc = AuthBloc();
  late Animation<double> animation;
  late AnimationController animationController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);

  @override
  void initState() {
    super.initState();
    authBloc = global<AuthBloc>();
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).unfocus();
    });
    _animationController(begin: 0.0, end: 0.9);
    animationController.forward().then((value) => {
          authBloc.add(AuthValidateEvent()),
        });
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _animationController(
      {int? duration, required double begin, required double end}) {
    animationController = AnimationController(
        duration: Duration(milliseconds: duration ?? 800), vsync: this);
    animation = Tween(begin: begin, end: end).animate(animationController)
      ..addListener(() {
        setState(() {
          /* the state that has changed here is the animation object’s value*/
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => Container(),
      ),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          bloc: authBloc,
          listener: (context, state) async {
            if (state is AuthAuthenticatedState) {
              _animationController(begin: 0.9, end: 1.0);
              await animationController.forward().then(
                (value) {
                  NavigationServices.pushAndRemoveUntil(context,
                      screen: const HomeScreen(),
                      routeName: HomeScreen.routeName);
                },
              );
            }
            if (state is AuthFinishWithError) {
              _animationController(begin: 0.9, end: 1.0);
              await animationController.forward().then(
                    (value) => {
                      // context.goNamed(GoRouters.errorLoad),
                      // navationErrorLoad(context),
                    },
                  );
            }
          },
          child: _loading(screenSize),
        ),
      ),
    );
  }

  Widget _loading(Size screenSize) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/icon.png',
                  height: screenSize.height * 0.15,
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: Responsive.isMobile(context)
                      ? screenSize.width * 0.60
                      : screenSize.width * 0.30,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  padding: const EdgeInsets.all(0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: LinearProgressIndicator(
                      minHeight: 5.0,
                      value: animation.value,
                      color: AppColors.primaryColor,
                      backgroundColor: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

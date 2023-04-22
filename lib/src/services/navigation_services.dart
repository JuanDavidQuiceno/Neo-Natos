import 'package:flutter/material.dart';

class NavigationServices {
  static pop(BuildContext context, {bool? result = true}) {
    return Navigator.pop(context, result);
  }

  static push(
    BuildContext context, {
    required Widget screen,
    required String routeName,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => screen,
      ),
    );
  }

  static pushAndRemoveUntil(
    BuildContext context, {
    required Widget screen,
    required String routeName,
  }) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => screen,
        ),
        (route) => false);
  }

  static pushAndRemoveUntilRouteName(
    BuildContext context, {
    required Widget screen,
    required String routeName,
    required String untilRouteName,
  }) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => screen,
        ),
        ModalRoute.withName(untilRouteName));
  }

  static popUntil(BuildContext context, {required String routeName}) {
    return Navigator.popUntil(context, ModalRoute.withName(routeName));
  }
}

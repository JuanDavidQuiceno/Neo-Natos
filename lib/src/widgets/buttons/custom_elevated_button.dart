import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final bool? expaned;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  const CustomElevatedButton(
      {super.key,
      this.onPressed,
      this.child,
      this.text,
      this.expaned = false,
      this.buttonStyle,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    if (expaned ?? false) return Expanded(child: button(context));
    return button(context);
  }

  Widget button(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: child ?? Text(text ?? 'Press me!', style: textStyle),
    );
  }
}

class CustomElevatedButtonIcon extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Widget? icon;
  final String? text;
  const CustomElevatedButtonIcon(
      {super.key, this.onPressed, this.child, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon ?? const SizedBox(),
        label: child ?? Text(text ?? 'Press me!'));
  }
}

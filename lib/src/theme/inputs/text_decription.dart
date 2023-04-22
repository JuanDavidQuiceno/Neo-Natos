import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  final String description;
  final Alignment? alignment;
  final Widget? child;
  final double? paddingBottom;
  final FontWeight? textSize;
  const DescriptionTextField({
    Key? key,
    required this.description,
    this.alignment,
    this.child,
    this.paddingBottom,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: alignment ?? Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              description,
              style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                    fontWeight: textSize ?? FontWeight.w600,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        if (child != null) child!,
        if (child != null) SizedBox(height: paddingBottom ?? 20),
      ],
    );
  }
}

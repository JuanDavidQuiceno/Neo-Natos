import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'input_decoration.dart';

enum IconPosition { left, right }

class StyleTextField {
  static TextStyle style(BuildContext context, {Color? textColor}) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          color: textColor ?? AppColors.textColor,
          fontWeight: FontWeight.w400,
        );
  }

  static InputDecoration inputDecoration(
    BuildContext context, {
    Color? fillColor,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.transparent,
      labelText: labelText,
      hintText: hintText,
      errorMaxLines: 3,
      // hoverColor: AppColors.primaryLightColor.withOpacity(0.2),
      hintStyle: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      helperText: helperText,
      helperStyle: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      contentPadding: contentPadding,
      isDense: isDense ?? false,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: DecorationInput.outline(color: AppColors.textColor),
      focusedBorder: DecorationInput.outline(color: AppColors.primaryColor),
      focusedErrorBorder: DecorationInput.outline(
        color: AppColors.red,
      ),
      disabledBorder: DecorationInput.outline(color: AppColors.textColor),
      enabledBorder: DecorationInput.outline(color: AppColors.textColor),
    );
  }

  static InputDecoration inputDecorationDeactive({
    required BuildContext context,
    Color? fillColor,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.transparent,
      labelText: labelText,
      hintText: hintText,
      errorMaxLines: 3,
      // hoverColor: AppColors.primaryLightColor.withOpacity(0.2),
      hintStyle: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      helperText: helperText,
      helperStyle: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      contentPadding: contentPadding,
      isDense: isDense ?? false,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: DecorationInput.outline(color: AppColors.hintColor),
      focusedBorder: DecorationInput.outline(color: AppColors.hintColor),
      focusedErrorBorder: DecorationInput.outline(
        color: AppColors.hintColor,
      ),
      disabledBorder: DecorationInput.outline(color: AppColors.hintColor),
      enabledBorder: DecorationInput.outline(color: AppColors.hintColor),
    );
  }
}

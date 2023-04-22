import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class DecorationInput {
  static OutlineInputBorder outline(
          {required Color color, double? ancho, double? bordeRadius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(
          bordeRadius ?? defaultBorderRadius,
        )),
        borderSide: BorderSide(
          width: ancho ?? 1,
          color: color,
        ),
      );

  static OutlineInputBorder outlineLeft(
          {required Color color, double? ancho, double? bordeRadius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            bordeRadius ?? defaultBorderRadius,
          ),
          bottomLeft: Radius.circular(
            bordeRadius ?? defaultBorderRadius,
          ),
        ),
        borderSide: BorderSide(
          width: ancho ?? 1,
          color: color,
        ),
      );

  UnderlineInputBorder lineinpunt(
          Color color, double ancho, double bordeRadius) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
          width: ancho,
          color: color,
        ),
      );
}

import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import 'app_bar_modal.dart';

class CustomButtomModal extends StatelessWidget {
  final String? title;
  final Widget? widget;
  final double? height;
  final BoxConstraints? constraints;

  const CustomButtomModal({
    Key? key,
    this.title,
    this.widget,
    this.height,
    this.constraints,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: Responsive.isDesktop(context)
            ? Responsive.desktopWidth(context)
            : MediaQuery.of(context).size.width,
        constraints: height != null
            ? null
            : BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.9,
                minHeight: MediaQuery.of(context).size.height * 0.3,
                maxWidth: Responsive.isDesktop(context)
                    ? Responsive.desktopWidth(context)
                    : MediaQuery.of(context).size.width,
              ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppBarModal(title: title),
            if (widget != null)
              Expanded(
                child: SafeArea(
                  bottom: true,
                  child: Scrollbar(
                    interactive: true,
                    child: SingleChildScrollView(
                      child: widget,
                    ),
                  ),
                ),
              )
          ],
        ),
      );

  static RoundedRectangleBorder style(BuildContext context) {
    return RoundedRectangleBorder(
      side: BorderSide(
        color: Theme.of(context).cardColor,
        width: 1,
      ),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
    );
  }
}

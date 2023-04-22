import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/responsive.dart';
import 'images/custom_image.dart';

class LoadingLogo extends StatelessWidget {
  const LoadingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.6)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomImage(
              image: 'assets/icon.png',
              height: size.height * 0.2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: Responsive.isMobile(context)
                  ? size.width * 0.60
                  : size.width * 0.30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: AppColors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Text(
              'Cargando...',
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

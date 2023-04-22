import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/responsive.dart';

class AppBarModal extends StatelessWidget {
  final String? title;

  const AppBarModal({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            height: 5,
            width: Responsive.isDesktop(context) || Responsive.isTablet(context)
                ? 100
                : MediaQuery.of(context).size.width * 0.3,
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(title ?? 'Seleccione',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                )
              ],
            ),
          )
        ],
      );
}

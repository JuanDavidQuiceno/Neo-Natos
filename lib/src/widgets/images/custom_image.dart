import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { file, network }

class CustomImage extends StatelessWidget {
  final String image;
  final bool? view;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final ImageType? type;
  const CustomImage({
    Key? key,
    required this.image,
    this.view,
    this.fit,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
    this.type,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: view == true
            ? () {
                // NavigationService.push(
                //   context: context,
                //   screen: ImageViewScreen(image: image, type: type),
                //   routeName: ImageViewScreen.routeName);
              }
            : null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          child: SizedBox(
            height: height,
            width: width,
            child: type == ImageType.file
                ? _imageFile()
                : image.startsWith('assets/')
                    ? _imageAsset()
                    : _imageNetwork(),
          ),
        ),
      );

  Widget _imageAsset() {
    return image.contains('.svg')
        ? SvgPicture.asset(
            image,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          )
        : Image.asset(
            image,
            color: color,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/no-image.png',
                fit: fit ?? BoxFit.cover,
              );
            },
          );
  }

  Widget _imageNetwork() {
    if (image.contains('.svg')) {
      return SvgPicture.network(
        image,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
        placeholderBuilder: (BuildContext context) => Image.asset(
          'assets/jar-loading.gif',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        ),
      );
    }
    return FadeInImage(
      placeholder: const AssetImage(
        'assets/jar-loading.gif',
      ),
      image: NetworkImage(image),
      imageErrorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(
          'assets/no-image.png',
          fit: fit ?? BoxFit.cover,
          filterQuality: FilterQuality.medium,
        );
      },
      fit: fit ?? BoxFit.cover,
    );
  }

  Widget _imageFile() {
    return Image.file(
      File(image),
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/no-image.png',
          fit: fit ?? BoxFit.cover,
        );
      },
    );
  }
}

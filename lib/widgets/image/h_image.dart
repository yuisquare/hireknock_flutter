import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:hire_knock/utils/logger.dart';

import '../../app_constants/app_images.dart';

enum ImageType {
  network,
  asset,
  memory,
}

class HImage extends StatelessWidget {
  const HImage({
    Key? key,
    required this.path,
    required this.imageType,
    this.height,
    this.width,
    this.byte,
    this.fit,
  }) : super(key: key);

  final String path;
  final ImageType imageType;
  final double? width;
  final double? height;
  final Uint8List? byte;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: path,
          width: width,
          height: height,
          fit: fit,
          errorWidget: (context, _, __) {
            return Image.asset(AppImage.baseUrlImages + 'AppImage.defaultMan');
          },
        );
      case ImageType.asset:
        return Image.asset(
          path,
          width: width,
          height: height,
          fit: fit,
        );
      case ImageType.memory:
        if (byte != null) {
          return Image.memory(
            byte!,
            width: width,
            height: height,
            fit: fit,
          );
        } else {
          Logger.error('Please provide a image byte data');
          return const SizedBox();
        }
    }
  }
}

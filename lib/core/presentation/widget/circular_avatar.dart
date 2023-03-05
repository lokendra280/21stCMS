import 'package:cms/core/presentation/widget/custom_catch_image.dart';
import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isBorderEnabled;
  final double? borderRadius;
  final BoxFit? fit;
  const CircularAvatar({
    this.isBorderEnabled = true,
    required this.imageUrl,
    this.borderRadius,
    this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isBorderEnabled == true
          ? BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(borderRadius ?? 100),
            )
          : null,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 100),
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomCachedNetworkImage(
              imageUrl,
              fit: fit,
            ),
          )),
    );
  }
}

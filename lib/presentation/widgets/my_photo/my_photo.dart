import 'package:flutter/material.dart';

import '../../../core/core.dart';

enum MyPhotoType { mobile, tablet, desktop }

class MyPhoto extends StatelessWidget {
  final MyPhotoType type;

  const MyPhoto({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculating Size
    final Size size = MediaQuery.of(context).size;

    double width;
    double height;

    switch (type) {
      case MyPhotoType.mobile:
        width = size.width * 0.5;
        height = size.height * 0.35;
        break;
      case MyPhotoType.tablet:
        width = size.width * 0.4;
        height = size.height * 0.35;
        break;
      case MyPhotoType.desktop:
        width = size.width * 0.25;
        height = size.height * 0.55;
        break;
    }

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          // bg container
          Positioned(
            left: 18.0,
            top: 18.0,
            right: 0.0,
            bottom: 0.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: AppTheme.ternaryColor,
                ),
              ),
            ),
          ),
          // photo
          Positioned(
            left: 0.0,
            top: 0.0,
            right: 18.0,
            bottom: 18.0,
            child: Image.asset(
              ImageAssets.myPhoto,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

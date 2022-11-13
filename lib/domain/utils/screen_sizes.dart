// Flutter imports:
import 'package:flutter/material.dart';

class ScreenSizes {
  final BoxConstraints constraints;
  ScreenSizes({required this.constraints});

  Size getScreenSize() {
    final double width = constraints.biggest.width;
    final double height = constraints.biggest.height;
    return width > 1200
        ? width < height
            ? const Size(1920, 1080)
            : const Size(1080, 1920)
        : width > 800 && width < 1200
            ? width < height
                ? const Size(1366, 768)
                : const Size(768, 1366)
            : width < height
                ? const Size(428, 926)
                : const Size(926, 428);
  }
}

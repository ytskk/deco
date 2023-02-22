import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double defaultSize = 16;

class IconBox extends StatelessWidget {
  const IconBox({
    super.key,
    required this.assetName,
    this.size = defaultSize,
    this.color,
  });

  final String assetName;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: size,
      height: size,
      color: color,
    );
  }
}

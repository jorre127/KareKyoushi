import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kare_kyoushi/util/env/flavor_config.dart';

class SvgIcon extends StatelessWidget {
  final String svgAsset;
  final Color color;
  final double? size;
  final bool userOrignalColor;

  const SvgIcon({
    required this.svgAsset,
    this.userOrignalColor = false,
    this.color = Colors.black,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isInTest()) {
      return FutureBuilder<String>(
        future: _getSvgString(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data != null) {
            return SvgPicture.string(
              data,
              height: size,
              width: size,
              colorFilter: userOrignalColor ? null : ColorFilter.mode(color, BlendMode.srcIn),
            );
          }
          return SizedBox(
            height: size,
            width: size,
          );
        },
      );
    }
    return SvgPicture.asset(
      svgAsset,
      height: size,
      width: size,
      colorFilter: userOrignalColor ? null : ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  Future<String> _getSvgString() async {
    return rootBundle.loadString(svgAsset);
  }
}

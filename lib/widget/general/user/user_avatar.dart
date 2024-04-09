import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class UserAvatar extends StatelessWidget {
  final Color? color;
  final String name;
  final String? photo;
  final double? size;
  final VoidCallback? onTapped;

  const UserAvatar({
    required this.name,
    this.color,
    this.size,
    this.onTapped,
    this.photo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => TouchFeedBack(
        onClick: onTapped,
        child: Container(
          width: size ?? 34,
          height: size ?? 34,
          decoration: BoxDecoration(
            color: color ?? theme.colorsTheme.button,
            shape: BoxShape.circle,
          ),
          child: photo == null
              ? Center(
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        name[0],
                        style: theme.textThemes.coreTextTheme.titleHuge,
                      ),
                    ),
                  ),
                )
              : Image.network(name),
        ),
      ),
    );
  }
}

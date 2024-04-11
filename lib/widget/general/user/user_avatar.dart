import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class UserAvatar extends StatelessWidget {
  final Color? color;
  final String name;
  final String? photo;
  final File? localPhoto;
  final double? size;
  final VoidCallback? onTapped;

  const UserAvatar({
    required this.name,
    this.localPhoto,
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
        onTapped: onTapped,
        child: Container(
          width: size ?? 34,
          height: size ?? 34,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: color ?? theme.colorsTheme.button,
            shape: BoxShape.circle,
          ),
          child: localPhoto != null
              ? Image.file(
                  localPhoto!,
                  fit: BoxFit.cover,
                )
              : photo != null
                  ? Image.network(
                      name,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            name[0],
                            style: theme.textThemes.coreTextTheme.titleHuge,
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}

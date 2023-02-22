import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({
    super.key,
    required this.url,
    this.accountName,
    this.radius,
    this.onTap,
  });

  /// The URL of the image to display.
  final String url;

  /// Will be used as cache key. Preferred to pass username.
  final String? accountName;

  /// Similar to [CircleAvatar.radius].
  final double? radius;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        foregroundImage: CachedNetworkImageProvider(
          url,
          cacheKey: 'account-avatar-$accountName',
        ),
      ),
    );
  }
}

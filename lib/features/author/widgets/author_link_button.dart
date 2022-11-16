import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthorLinkButton extends StatelessWidget {
  const AuthorLinkButton({
    super.key,
    required this.data,
  });

  final AuthorLinkData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: data.onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurfaceVariant.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                data.icon,
                width: 20,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                data.text,
                style: theme.textTheme.labelSmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthorLinkData {
  const AuthorLinkData({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  /// Path to the icon asset file.
  final String icon;
  final String text;
  final VoidCallback onPressed;
}

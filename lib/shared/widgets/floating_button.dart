import 'dart:ui';

import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: FadingButton(
            onPressed: onPressed,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiaryContainer.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

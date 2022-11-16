import 'package:flutter/material.dart';

typedef AdaptiveWidgetBuilder = Widget Function(
  BuildContext context,
);

class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    super.key,
    this.cupertino,
    this.material,
    required this.defaultBuilder,
    required this.type,
  });

  final AdaptiveWidgetBuilder defaultBuilder;
  final AdaptiveWidgetBuilder? cupertino;
  final AdaptiveWidgetBuilder? material;
  final AdaptiveWidgetType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AdaptiveWidgetType.adaptive:
        final platform = Theme.of(context).platform;

        if (platform == TargetPlatform.iOS ||
            platform == TargetPlatform.macOS) {
          return cupertino?.call(context) ?? defaultBuilder(context);
        }

        return material?.call(context) ?? defaultBuilder(context);
      case AdaptiveWidgetType.cupertino:
        return cupertino?.call(context) ?? defaultBuilder(context);
      case AdaptiveWidgetType.material:
        return material?.call(context) ?? defaultBuilder(context);
    }
  }
}

enum AdaptiveWidgetType {
  adaptive,
  cupertino,
  material,
}

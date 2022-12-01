import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator.material({
    super.key,
    this.isAdaptive = false,
  }) : isCupertino = false;

  const Separator.cupertino({
    super.key,
    this.isAdaptive = false,
  }) : isCupertino = true;

  const Separator.adaptive({
    super.key,
  })  : isCupertino = false,
        isAdaptive = true;

  final bool isCupertino;
  final bool isAdaptive;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (isAdaptive) {
      if (platform == TargetPlatform.iOS) {
        return const _CupertinoSeparator();
      }

      return const _MaterialSeparator();
    }

    if (isCupertino) {
      return const _CupertinoSeparator();
    }

    return const _MaterialSeparator();
  }
}

class _MaterialSeparator extends StatelessWidget {
  const _MaterialSeparator();

  @override
  Widget build(BuildContext context) {
    return const Divider();
  }
}

class _CupertinoSeparator extends StatelessWidget {
  const _CupertinoSeparator();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 16,
      height: 0,
      thickness: 0.5,
    );
  }
}

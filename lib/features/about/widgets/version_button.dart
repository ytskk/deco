import 'package:dev_community/features/features.dart';
import 'package:flutter/material.dart';

class VersionButton extends StatelessWidget {
  const VersionButton({
    super.key,
    required this.version,
    this.onTap,
  });

  final AppChangelogModel version;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Text(
              version.icon,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(width: 8),
            Text(
              version.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}

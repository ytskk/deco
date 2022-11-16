import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableGroup extends ConsumerWidget {
  const TableGroup({
    super.key,
    this.title,
    required this.children,
    this.separate = true,
  });

  final String? title;
  final List<Widget> children;
  final bool separate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            PaddedTitle(title: title!),
            const SizedBox(height: 4),
          ],
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: separate ? _separateChildren(children) : children,
            ),
          ),
        ],
      ),
    );
  }

  /// Adds [Separator] after each child except the last.
  List<Widget> _separateChildren(List<Widget> children) {
    if (children.isEmpty || children.length == 1) {
      return children;
    }

    const separator = Separator.adaptive();

    List<Widget> wrapTile(Widget tile) {
      return [
        tile,
        separator,
      ];
    }

    return <Widget>[
      ...children.take(children.length - 1).map(wrapTile).expand((x) => x),
      children.last,
    ];
  }
}

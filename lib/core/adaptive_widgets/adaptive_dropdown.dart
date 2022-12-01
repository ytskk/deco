import 'dart:developer';

import 'package:dev_community/core/adaptive_widgets/adaptive_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class DropdownValue<T> {
  const DropdownValue({
    required this.value,
    required this.title,
  });

  final String title;
  final T value;
}

typedef DropdownItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  Future<void> Function(BuildContext context) showMenu,
);

class AdaptiveDropdown<T> extends StatelessWidget {
  const AdaptiveDropdown({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    this.type = AdaptiveWidgetType.adaptive,
    this.titleValue,
    required this.itemBuilder,
  });

  final List<DropdownValue<T>> items;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final String? titleValue;
  final AdaptiveWidgetType type;
  final DropdownItemBuilder<T> itemBuilder;

  Widget _buildMaterialDropdown(BuildContext context) {
    return _MaterialDropdown<T>(
      items: items,
      onChanged: onChanged,
      value: value,
      itemBuilder: itemBuilder,
    );
  }

  Widget _buildCupertinoDropdown(BuildContext context) {
    return _CupertinoDropdown<T>(
      items: items,
      onChanged: onChanged,
      value: value,
      itemBuilder: itemBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      defaultBuilder: _buildMaterialDropdown,
      material: _buildMaterialDropdown,
      cupertino: _buildCupertinoDropdown,
      type: type,
    );
  }
}

class _MaterialDropdown<T> extends StatefulWidget {
  const _MaterialDropdown({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    required this.itemBuilder,
  });

  final List<DropdownValue<T>> items;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final Widget Function(
    BuildContext context,
    T item,
    Future<void> Function(BuildContext context) showMenu,
  ) itemBuilder;

  @override
  State<_MaterialDropdown<T>> createState() => _MaterialDropdownState<T>();
}

class _MaterialDropdownState<T> extends State<_MaterialDropdown<T>> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final buttonBuilder =
        widget.itemBuilder(context, widget.value!, showButtonMenu);

    return AnimatedOpacity(
      opacity: isPressed ? 0.5 : 1,
      duration: const Duration(milliseconds: 335),
      curve: Curves.linearToEaseOut,
      child: buttonBuilder,
    );
  }

  Future<void> showButtonMenu(BuildContext context) async {
    final button = context.findRenderObject()! as RenderBox;
    final overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    const offset = Offset(1, 0);

    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(offset, ancestor: overlay),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero) + offset,
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    setState(() => isPressed = true);

    await _showMaterialMenu(
      context: context,
      items: widget.items,
      position: position,
      value: widget.value,
      onChanged: widget.onChanged,
    );

    setState(() => isPressed = false);
  }

  Future<VoidCallback?> _showMaterialMenu({
    required BuildContext context,
    required List<DropdownValue<T>> items,
    required RelativeRect position,
    required T? value,
    required ValueChanged<T?>? onChanged,
  }) async {
    final result = await showMenu<T?>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      context: context,
      position: position,
      items: _buildDropdownMenuItems(context, items),
    );

    if (result != null) {
      onChanged?.call(result);
    }

    return null;
  }

  List<PopupMenuItem<T>> _buildDropdownMenuItems(
    BuildContext context,
    List<DropdownValue<T>> items,
  ) {
    final itemTextStyle = Theme.of(context).textTheme.labelLarge;

    return items.map((item) {
      return PopupMenuItem(
        value: item.value,
        child: Text(
          item.title,
          style: itemTextStyle,
        ),
      );
    }).toList();
  }
}

class _CupertinoDropdown<T> extends StatelessWidget {
  const _CupertinoDropdown({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    required this.itemBuilder,
  });
  final List<DropdownValue<T>> items;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final DropdownItemBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return PullDownButton(
      itemBuilder: (context) => _buildDropdownMenuItems(items),
      offset: const Offset(1, 0),
      position: PullDownMenuPosition.automatic,
      buttonBuilder: (context, showMenu) {
        return itemBuilder(
          context,
          value!,
          (context) async {
            await showMenu();
          },
        );
      },
    );
  }

  List<PullDownMenuEntry> _buildDropdownMenuItems(
    List<DropdownValue<T>> items,
  ) {
    final List<PullDownMenuEntry> widgets = [];

    for (final item in items.take(items.length - 1)) {
      widgets.addAll([
        PullDownMenuItem(
          onTap: () => onChanged?.call(item.value),
          title: item.title,
        ),
        const PullDownMenuDivider(),
      ]);
    }

    widgets.add(
      PullDownMenuItem(
        onTap: () => onChanged?.call(items.last.value),
        title: items.last.title,
      ),
    );

    return widgets;
  }
}

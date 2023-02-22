import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class AdaptiveSearchField extends StatefulWidget {
  const AdaptiveSearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  State<AdaptiveSearchField> createState() => _AdaptiveSearchFieldState();
}

class _AdaptiveSearchFieldState extends State<AdaptiveSearchField>
    with AutomaticKeepAliveClientMixin {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
    log('adaptive search field disposed');
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !Platform.isIOS || Platform.isMacOS) {
      return _MaterialTextField(
        controller: _controller,
        onChanged: widget.onChanged,
        focusNode: _focusNode,
      );
    }

    return _CupertinoTextField(
      controller: _controller,
      onChanged: widget.onChanged,
      focusNode: _focusNode,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CupertinoTextField extends StatelessWidget {
  const _CupertinoTextField({
    required this.controller,
    required this.focusNode,
    this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    return CupertinoSearchTextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      style: bodyMedium,
    );
  }
}

class _MaterialTextField extends StatelessWidget {
  const _MaterialTextField({
    required this.controller,
    required this.focusNode,
    this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    log('focusNode: ${focusNode.hasFocus}');

    return TextField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      onEditingComplete: focusNode.unfocus,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: focusNode.hasFocus
            ? IconButton(
                onPressed: () {
                  controller.clear();
                  onChanged?.call('');
                },
                icon: const Icon(Icons.clear_rounded),
              )
            : null,
      ),
    );
  }
}

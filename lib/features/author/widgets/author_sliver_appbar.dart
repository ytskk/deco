import 'dart:developer';
import 'dart:math' as math;

import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthorSliverAppbar extends StatelessWidget {
  const AuthorSliverAppbar({
    super.key,
    required this.author,
    this.actions,
  });

  final AuthorInfoModel author;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar.medium(
      expandedHeight: 220,
      actions: actions,
      surfaceTintColor: theme.colorScheme.surface,
      flexibleSpace: CustomFlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1.35,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    author.name.trim(),
                    style: theme.textTheme.displaySmall!.medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (author.isOrganization)
                    Positioned(
                      right: -22,
                      child: Text(
                        AppStrings.authorInfoAppBarOrganizationBadgeTitle,
                        style: theme.textTheme.labelSmall!.semibold.secondary,
                      ),
                    ),
                ],
              ),
              GestureDetector(
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: author.username));
                  HapticFeedback.mediumImpact();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.authorInfoAppBarUsernameCopied),
                    ),
                  );
                },
                child: Text(
                  author.username.trim(),
                  style: theme.textTheme.labelLarge!.semibold.secondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        background: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                log('TODO: Open profile image in fullscreen');
              },
              child: AccountAvatar(
                url: author.profileImage,
                radius: 44,
                accountName: author.username,
              ),
            ),
            const SizedBox(height: 84),
          ],
        ),
      ),
    );
  }
}

/// TODO: Customize space bar.
///  - Make username change fontWidth.
///  - Scale and show background image in collapsed mode
class CustomFlexibleSpaceBar extends StatefulWidget {
  /// Creates a flexible space bar.
  ///
  /// Most commonly used in the [AppBar.flexibleSpace] field.
  const CustomFlexibleSpaceBar({
    super.key,
    this.title,
    this.background,
    this.centerTitle = true,
    this.titlePadding,
    this.collapseMode = CollapseMode.parallax,
    this.stretchModes = const <StretchMode>[StretchMode.zoomBackground],
    this.expandedTitleScale = 1.5,
  }) : assert(expandedTitleScale >= 1, 'expandedTitleScale must be >= 1');

  /// The primary contents of the flexible space bar when expanded.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Shown behind the [title] when expanded.
  ///
  /// Typically an [Image] widget with [Image.fit] set to [BoxFit.cover].
  final Widget? background;

  /// Whether the title should be centered.
  ///
  /// By default this property is true if the current target platform
  /// is [TargetPlatform.iOS] or [TargetPlatform.macOS], false otherwise.
  final bool? centerTitle;

  /// Collapse effect while scrolling.
  ///
  /// Defaults to [CollapseMode.parallax].
  final CollapseMode collapseMode;

  /// Stretch effect while over-scrolling.
  ///
  /// Defaults to include [StretchMode.zoomBackground].
  final List<StretchMode> stretchModes;

  /// Defines how far the [title] is inset from either the widget's
  /// bottom-left or its center.
  ///
  /// Typically this property is used to adjust how far the title is
  /// is inset from the bottom-left and it is specified along with
  /// [centerTitle] false.
  ///
  /// By default the value of this property is
  /// `EdgeInsetsDirectional.only(start: 72, bottom: 16)` if the title is
  /// not centered, `EdgeInsetsDirectional.only(start: 0, bottom: 16)` otherwise.
  final EdgeInsetsGeometry? titlePadding;

  /// Defines how much the title is scaled when the FlexibleSpaceBar is expanded
  /// due to the user scrolling downwards. The title is scaled uniformly on the
  /// x and y axes while maintaining its bottom-left position (bottom-center if
  /// [centerTitle] is true).
  ///
  /// Defaults to 1.5 and must be greater than 1.
  final double expandedTitleScale;

  /// Wraps a widget that contains an [AppBar] to convey sizing information down
  /// to the [CustomFlexibleSpaceBar].
  ///
  /// Used by [Scaffold] and [SliverAppBar].
  ///
  /// `toolbarOpacity` affects how transparent the text within the toolbar
  /// appears. `minExtent` sets the minimum height of the resulting
  /// [CustomFlexibleSpaceBar] when fully collapsed. `maxExtent` sets the maximum
  /// height of the resulting [CustomFlexibleSpaceBar] when fully expanded.
  /// `currentExtent` sets the scale of the [CustomFlexibleSpaceBar.background] and
  /// [CustomFlexibleSpaceBar.title] widgets of [CustomFlexibleSpaceBar] upon
  /// initialization. `scrolledUnder` is true if the [CustomFlexibleSpaceBar]
  /// overlaps the app's primary scrollable, false if it does not, and null
  /// if the caller has not determined as much.
  /// See also:
  ///
  ///  * [FlexibleSpaceBarSettings] which creates a settings object that can be
  ///    used to specify these settings to a [CustomFlexibleSpaceBar].
  static Widget createSettings({
    double? toolbarOpacity,
    double? minExtent,
    double? maxExtent,
    bool? isScrolledUnder,
    required double currentExtent,
    required Widget child,
  }) {
    return FlexibleSpaceBarSettings(
      toolbarOpacity: toolbarOpacity ?? 1.0,
      minExtent: minExtent ?? currentExtent,
      maxExtent: maxExtent ?? currentExtent,
      isScrolledUnder: isScrolledUnder,
      currentExtent: currentExtent,
      child: child,
    );
  }

  @override
  State<CustomFlexibleSpaceBar> createState() => _CustomFlexibleSpaceBarState();
}

class _CustomFlexibleSpaceBarState extends State<CustomFlexibleSpaceBar> {
  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (widget.centerTitle != null) {
      return widget.centerTitle!;
    }
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }

  Alignment _getTitleAlignment(bool effectiveCenterTitle) {
    if (effectiveCenterTitle) {
      return Alignment.bottomCenter;
    }
    final textDirection = Directionality.of(context);
    switch (textDirection) {
      case TextDirection.rtl:
        return Alignment.bottomRight;
      case TextDirection.ltr:
        return Alignment.bottomLeft;
    }
  }

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (widget.collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0;
      case CollapseMode.parallax:
        final deltaExtent = settings.maxExtent - settings.minExtent;
        return -Tween<double>(begin: 0, end: deltaExtent / 4.0).transform(t);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;

        final children = <Widget>[];

        final deltaExtent = settings.maxExtent - settings.minExtent;

        // 0.0 -> Expanded
        // 1.0 -> Collapsed to toolbar
        final t = clampDouble(
          1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent,
          0,
          1,
        );

        // background
        if (widget.background != null) {
          final double fadeStart =
              math.max(0, 1.0 - kToolbarHeight / deltaExtent);
          const fadeEnd = 1.0;
          assert(
            fadeStart <= fadeEnd,
            'fadeStart must be less than or equal to fadeEnd',
          );
          // If the min and max extent are the same, the app bar cannot collapse
          // and the content should be visible, so opacity = 1.
          final opacity = settings.maxExtent == settings.minExtent
              ? 1.0
              : 1.0 - Interval(fadeStart, fadeEnd).transform(t);
          var height = settings.maxExtent;

          // StretchMode.zoomBackground
          if (widget.stretchModes.contains(StretchMode.zoomBackground) &&
              constraints.maxHeight > height) {
            height = constraints.maxHeight;
          }
          children.add(
            Positioned(
              top: _getCollapsePadding(t, settings),
              left: 0,
              right: 0,
              height: height,
              child: Opacity(
                // IOS is relying on this semantics node to correctly traverse
                // through the app bar when it is collapsed.
                alwaysIncludeSemantics: true,
                opacity: opacity,
                child: widget.background,
              ),
            ),
          );
        }

        // title
        if (widget.title != null) {
          final theme = Theme.of(context);

          Widget? title;
          switch (theme.platform) {
            case TargetPlatform.iOS:
            case TargetPlatform.macOS:
              title = widget.title;
              break;
            case TargetPlatform.android:
            case TargetPlatform.fuchsia:
            case TargetPlatform.linux:
            case TargetPlatform.windows:
              title = Semantics(
                namesRoute: true,
                child: widget.title,
              );
              break;
          }

          final opacity = settings.toolbarOpacity;
          if (opacity > 0.0) {
            var titleStyle = theme.primaryTextTheme.headline6!;
            titleStyle = titleStyle.copyWith(
              color: titleStyle.color!.withOpacity(opacity),
            );
            final effectiveCenterTitle = _getEffectiveCenterTitle(theme);
            final padding = widget.titlePadding ??
                EdgeInsetsDirectional.only(
                  start: effectiveCenterTitle ? 0.0 : 72.0,
                  bottom: 16,
                );
            final scaleValue =
                Tween<double>(begin: widget.expandedTitleScale, end: 1)
                    .transform(t);
            final scaleTransform = Matrix4.identity()
              ..scale(scaleValue, scaleValue, 1);
            final titleAlignment = _getTitleAlignment(effectiveCenterTitle);
            children.add(
              Container(
                padding: padding,
                child: Transform(
                  alignment: titleAlignment,
                  transform: scaleTransform,
                  child: Align(
                    alignment: titleAlignment,
                    child: DefaultTextStyle(
                      style: titleStyle,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Container(
                            width: constraints.maxWidth / scaleValue,
                            alignment: titleAlignment,
                            child: title,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }

        return ClipRect(child: Stack(children: children));
      },
    );
  }
}

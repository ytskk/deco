import 'package:flutter/material.dart';

class FadingButton extends StatefulWidget {
  const FadingButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;
  bool get enabled => onPressed != null;

  @override
  State<FadingButton> createState() => _FadingButtonState();
}

class _FadingButtonState extends State<FadingButton>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  final Tween<double> _opacityTween = Tween<double>(begin: 1);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  // uncomment when you will need it :)
  // @override
  // void didUpdateWidget(FadingButton old) {
  //   super.didUpdateWidget(old);
  //   log(
  //     'didUpdateWidget',
  //     name: 'FadingButton::didUpdateWidget',
  //   );
  //   _setTween();
  // }

  void _setTween() {
    _opacityTween.end = 0.4;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final wasHeldDown = _buttonHeldDown;
    final ticker = _buttonHeldDown
        ? _animationController.animateTo(
            1,
            duration: kFadeOutDuration,
            curve: Curves.easeInOutCubicEmphasized,
          )
        : _animationController.animateTo(
            0,
            duration: kFadeInDuration,
            curve: Curves.easeOutCubic,
          );
    ticker.then<void>(
      (void value) {
        if (mounted && wasHeldDown != _buttonHeldDown) {
          _animate();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.enabled;

    final theme = Theme.of(context);

    final foregroundColor = enabled ? null : theme.colorScheme.outline;
    final textStyle =
        theme.textTheme.bodyMedium!.copyWith(color: foregroundColor);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTap: widget.onPressed,
      onTapCancel: _handleTapCancel,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: DefaultTextStyle(
          style: textStyle,
          child: IconTheme(
            data: IconThemeData(color: foregroundColor),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color thumbColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final double borderWidth;
  final Duration animationDuration;

  const CustomToggleButton({
    super.key,
    this.initialValue = false,
    this.onChanged,
    this.activeTrackColor = Colors.green,
    this.inactiveTrackColor = Colors.grey,
    this.thumbColor = Colors.white,
    this.activeBorderColor = Colors.red,
    this.inactiveBorderColor = Colors.red,
    this.borderWidth = 4.0,
    this.animationDuration = const Duration(milliseconds: 250),
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _thumbAlignmentAnimation;
  late Animation<Color?> _trackColorAnimation;
  late Animation<Color?> _borderColorAnimation;
  late bool _isToggled;

  @override
  void initState() {
    super.initState();
    _isToggled = widget.initialValue;

    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    // Thumb position animation
    _thumbAlignmentAnimation =
        AlignmentTween(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    // Track color animation
    _trackColorAnimation =
        ColorTween(
          begin: widget.inactiveTrackColor,
          end: widget.activeTrackColor,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    // Border color animation
    _borderColorAnimation =
        ColorTween(
          begin: widget.inactiveBorderColor,
          end: widget.activeBorderColor,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    // Set initial state
    if (_isToggled) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isToggled = !_isToggled;
    });

    if (_isToggled) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    // Call the callback if provided
    widget.onChanged?.call(_isToggled);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: SizedBox(
        height: 40,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Stack(
              children: [
                // Track (background)
                Center(
                  child: Container(
                    height: 25,
                    width: 55,
                    decoration: BoxDecoration(
                      color: _trackColorAnimation.value,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
                // Thumb (circle)
                Align(
                  alignment: _thumbAlignmentAnimation.value,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.5,
                    ), // Center the thumb properly
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: widget.thumbColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            _borderColorAnimation.value ??
                            widget.inactiveBorderColor,
                        width: widget.borderWidth,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';

class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    required this.height,
    this.width = double.maxFinite,
    this.borderRadius = 10,
    this.padding,
    this.alignment,
    this.shape = BoxShape.rectangle,
  });

  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsets? padding;
  final BoxShape shape;
  final AlignmentGeometry? alignment;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    lowerBound: 0.4,
    upperBound: 0.8,
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Align(
        alignment: widget.alignment ?? Alignment.center,
        child: Container(
          height: widget.height,
          width: widget.width,
          margin: widget.padding,
          decoration: BoxDecoration(
            shape: widget.shape,
            color: AppColors.secondary4,
            borderRadius: widget.shape == BoxShape.circle
                ? null
                : BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
    );
  }
}

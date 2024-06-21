import 'package:flutter/cupertino.dart';
import 'package:bhc_mobile_app/util/consts.dart';

class InActiveWidget extends StatelessWidget {
  const InActiveWidget({
    super.key,
    required this.child,
    required this.isActive,
  });

  final Widget child;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !isActive,
      child: AnimatedOpacity(
        opacity: isActive ? 1 : 0.45,
        duration: duration_400ms,
        child: child,
      ),
    );
  }
}

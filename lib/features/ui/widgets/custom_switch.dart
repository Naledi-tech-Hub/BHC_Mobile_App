import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/util/consts.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  final ValueChanged<bool>? onChanged;
  final bool value;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool get isEnabled => widget.onChanged != null;
  late bool value = widget.value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled
          ? () {
              setState(() {
                value = !value;
              });
              widget.onChanged!(value);
            }
          : null,
      child: AnimatedContainer(
        duration: duration_200ms,
        height: Sizes.p24,
        width: Sizes.p36,
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: value ? AppColors.tertiary4 : AppColors.white,
          border: Border.all(
            color: value ? AppColors.tertiary5 : AppColors.secondary5,
          ),
          borderRadius: BorderRadius.circular(Sizes.p999),
        ),
        child: AnimatedContainer(
          duration: duration_200ms,
          height: Sizes.p16,
          width: Sizes.p16,
          margin: const EdgeInsets.all(Sizes.p2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value ? AppColors.white : AppColors.secondary4,
          ),
        ),
      ),
    );
  }
}

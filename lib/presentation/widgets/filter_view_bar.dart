import 'package:flutter/material.dart';
import 'package:slicing_ui/utils/app_colors.dart';

class FilterViewBar extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;
  final IconData? icon;

  const FilterViewBar({
    super.key,
    required this.isActive,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? AppColors.orange100 : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      width: 36,
      height: 36,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          onTap: onTap,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              color: isActive ? AppColors.orange400 : AppColors.grey700,
              size: 24,
            ),
          ]),
        ),
      ),
    );
  }
}

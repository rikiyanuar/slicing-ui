import 'package:flutter/material.dart';
import 'package:slicing_ui/utils/app_colors.dart';

import '../../utils/text_styles.dart';

class FilterCategoryMenu extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback? onTap;
  final IconData? prefixIcon;

  const FilterCategoryMenu({
    super.key,
    required this.text,
    required this.isActive,
    this.onTap,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? AppColors.orange100 : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: isActive ? AppColors.orange400 : Colors.white,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(children: [
              Visibility(
                visible: prefixIcon != null,
                child: Icon(
                  prefixIcon,
                  color: isActive ? AppColors.orange400 : AppColors.grey700,
                  size: 16,
                ),
              ),
              Visibility(
                visible: prefixIcon != null,
                child: const SizedBox(width: 5),
              ),
              Text(
                text,
                style: TextStyles.w400.copyWith(
                  color: isActive ? AppColors.orange400 : AppColors.grey600,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:slicing_ui/utils/app_colors.dart';

import '../../utils/text_styles.dart';

class ButtonOutline extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final double prefixIconSize;

  const ButtonOutline({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.orange100,
    this.borderColor = AppColors.orange400,
    this.borderRadius = 80,
    this.onTap,
    this.prefixIcon,
    this.prefixIconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        border: Border.all(color: borderColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(children: [
              Visibility(
                visible: prefixIcon != null,
                child:
                    Icon(prefixIcon, color: borderColor, size: prefixIconSize),
              ),
              Visibility(
                visible: prefixIcon != null,
                child: const SizedBox(width: 12),
              ),
              Text(text, style: TextStyles.w600.copyWith(color: borderColor))
            ]),
          ),
        ),
      ),
    );
  }
}

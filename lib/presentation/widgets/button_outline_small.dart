import 'package:flutter/material.dart';
import 'package:slicing_ui/utils/app_colors.dart';

import '../../utils/text_styles.dart';

class ButtonOutlineSmall extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final double prefixIconSize;

  const ButtonOutlineSmall({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.orange100,
    this.borderColor = AppColors.orange400,
    this.borderRadius = 10,
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Visibility(
                visible: prefixIcon != null,
                child:
                    Icon(prefixIcon, color: borderColor, size: prefixIconSize),
              ),
              Visibility(
                visible: prefixIcon != null,
                child: const SizedBox(width: 4),
              ),
              Text(
                text,
                style: TextStyles.w600.copyWith(
                  color: borderColor,
                  fontSize: 11,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

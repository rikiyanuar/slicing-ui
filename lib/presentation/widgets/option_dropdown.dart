import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';

class OptionDropdown extends StatelessWidget {
  final String text;
  final IconData icon;

  const OptionDropdown({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey400),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.grey500,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyles.w600.copyWith(
            color: AppColors.grey500,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Icon(
          PhosphorIcons.regular.caretDown,
          size: 20,
          color: AppColors.grey500,
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:slicing_ui/utils/formatter.dart';

import '../../domain/entity/order_entity.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';
import '../widgets/button_outline_small.dart';
import '../widgets/dash_divider.dart';
import '../widgets/option_dropdown.dart';

class TransactionFragment extends StatelessWidget {
  final List<OrderEntity> orderList;

  const TransactionFragment({
    super.key,
    required this.orderList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        ..._buildTopSection(),
        const Divider(
          color: AppColors.grey300,
          height: 24,
          thickness: 1.8,
        ),
        _buildOrderList(),
        _buildPayment(),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(
            child: ButtonOutlineSmall(
              text: "Pilih Diskon",
              backgroundColor: Colors.white,
              prefixIcon: PhosphorIcons.regular.ticket,
              prefixIconSize: 16,
              borderColor: AppColors.grey500,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: ButtonOutlineSmall(
              text: "Kirim ke dapur",
              backgroundColor: Colors.white,
              prefixIcon: PhosphorIcons.regular.telegramLogo,
              prefixIconSize: 16,
              borderColor: AppColors.grey500,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: ButtonOutlineSmall(
              text: "Simpan",
              backgroundColor: Colors.white,
              prefixIcon: PhosphorIcons.regular.scroll,
              prefixIconSize: 16,
            ),
          ),
        ]),
        const SizedBox(height: 8),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.orange400,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          height: 52,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Bayar",
              style: TextStyles.w600.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Icon(PhosphorIcons.regular.arrowRight, color: Colors.white)
          ]),
        )
      ]),
    );
  }

  Container _buildPayment() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Subtotal",
            style: TextStyles.w400.copyWith(color: AppColors.black),
          ),
          Text(
            Formatter.idrMoneyFormat(value: 265000, pattern: "Rp"),
            style: TextStyles.w400.copyWith(color: AppColors.black),
          ),
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Pajak",
            style: TextStyles.w400.copyWith(color: AppColors.black),
          ),
          Text(
            Formatter.idrMoneyFormat(value: 26500, pattern: "Rp"),
            style: TextStyles.w400.copyWith(color: AppColors.black),
          ),
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Diskon",
            style: TextStyles.w400.copyWith(color: AppColors.black),
          ),
          Text(
            Formatter.idrMoneyFormat(value: 0, pattern: "Rp"),
            style: TextStyles.w400.copyWith(color: AppColors.black),
          ),
        ]),
        const SizedBox(height: 8),
        const DashDivider(color: AppColors.grey400),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Total",
            style: TextStyles.w700.copyWith(color: AppColors.black),
          ),
          Text(
            Formatter.idrMoneyFormat(value: 291500, pattern: "Rp"),
            style: TextStyles.w700.copyWith(color: AppColors.black),
          ),
        ])
      ]),
    );
  }

  Expanded _buildOrderList() {
    return Expanded(
      child: ListView.separated(
        itemCount: orderList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final data = orderList[index];

          return Container(
            decoration: const BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              _buildOrderListMenu(data),
              if (data.notes != null)
                Row(children: [
                  Container(
                    width: 4,
                    decoration: BoxDecoration(
                      color: AppColors.orange400,
                      borderRadius: data.notes == null
                          ? const BorderRadius.all(Radius.circular(8))
                          : const BorderRadius.vertical(
                              bottom: Radius.circular(8)),
                    ),
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    PhosphorIcons.duotone.clipboardText,
                    color: AppColors.grey500,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    data.notes!,
                    style: TextStyles.w600.copyWith(
                      color: AppColors.grey500,
                    ),
                  ),
                ])
            ]),
          );
        },
      ),
    );
  }

  Row _buildOrderListMenu(OrderEntity data) {
    final total = data.price * data.qty;

    return Row(children: [
      Container(
        width: 4,
        decoration: BoxDecoration(
          color: AppColors.orange400,
          borderRadius: data.notes == null
              ? const BorderRadius.all(Radius.circular(8))
              : const BorderRadius.vertical(top: Radius.circular(8)),
        ),
        height: 24,
      ),
      const SizedBox(width: 8),
      Text(
        data.title,
        style: TextStyles.w600.copyWith(color: AppColors.black),
      ),
      const SizedBox(width: 8),
      Container(
        decoration: const BoxDecoration(
            color: AppColors.orange100, shape: BoxShape.circle),
        width: 20,
        height: 20,
        alignment: Alignment.center,
        child: Text(
          data.qty.toString(),
          style: TextStyles.w600
              .copyWith(fontSize: 10, color: AppColors.orange400),
        ),
      ),
      const Spacer(),
      Text(
        Formatter.idrMoneyFormat(value: total, pattern: "Rp"),
        style: TextStyles.w600.copyWith(color: AppColors.grey700),
      ),
      const SizedBox(width: 10),
      Icon(
        PhosphorIcons.duotone.xCircle,
        size: 20,
        color: AppColors.grey500,
      )
    ]);
  }

  _buildTopSection() {
    return [
      Row(children: [
        Expanded(
          child: OptionDropdown(
            text: "Dine-In",
            icon: PhosphorIcons.regular.forkKnife,
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: OptionDropdown(
            text: "Pilih Meja",
            icon: Icons.table_bar_outlined,
          ),
        ),
      ]),
      const SizedBox(height: 10),
      OptionDropdown(
        text: "Masukkan Nama Pelanggan",
        icon: PhosphorIcons.duotone.addressBook,
      )
    ];
  }
}

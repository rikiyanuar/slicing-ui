import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../domain/entity/menu_entity.dart';
import '../../utils/app_colors.dart';
import '../../utils/formatter.dart';
import '../../utils/text_styles.dart';
import '../widgets/filter_category_menu.dart';
import '../widgets/filter_view_bar.dart';

class MainMenuFragment extends StatelessWidget {
  final List<MenuEntity> menuList;

  const MainMenuFragment({super.key, required this.menuList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Row(children: [
          _buildFilterCategoryMenu(),
          const Spacer(),
          _buildFilterViewBar(),
        ]),
        const SizedBox(height: 20),
        Expanded(
          child: _buildGridView(),
        ),
        _buildIndicator()
      ]),
    );
  }

  Widget _buildIndicator() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: const BoxDecoration(
          color: AppColors.orange400,
          shape: BoxShape.circle,
        ),
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4),
      ),
      Container(
        decoration: const BoxDecoration(
          color: AppColors.grey500,
          shape: BoxShape.circle,
        ),
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4),
      ),
      Container(
        decoration: const BoxDecoration(
          color: AppColors.grey500,
          shape: BoxShape.circle,
        ),
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4),
      ),
    ]);
  }

  GridView _buildGridView() {
    return GridView.count(
      crossAxisCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 14,
      childAspectRatio: 0.96,
      children: menuList.map((data) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.3),
                spreadRadius: -2,
                blurRadius: 10,
              )
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: _buildGridContent(data),
        );
      }).toList(),
    );
  }

  Column _buildGridContent(MenuEntity data) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(children: [
        _buildGridContentImage(data),
        if (data.order != null) _buildGridContentOrder(data),
        if (data.stock != null) _buildGridContentStock(data),
      ]),
      Row(children: [
        Text(
          data.title,
          style: TextStyles.w700.copyWith(color: AppColors.grey700),
        ),
        if (data.tag != null)
          Container(
            decoration: const BoxDecoration(
                color: AppColors.grey200, shape: BoxShape.circle),
            width: 20,
            height: 20,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 4),
            child: Text(
              data.tag.toString(),
              style: TextStyles.w600
                  .copyWith(fontSize: 10, color: AppColors.grey500),
            ),
          )
      ]),
      Text(
        Formatter.idrMoneyFormat(value: data.price, pattern: "Rp"),
        style: TextStyles.w400.copyWith(color: AppColors.grey500),
      ),
    ]);
  }

  Positioned _buildGridContentStock(MenuEntity data) {
    return Positioned(
      left: 4,
      top: 4,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        padding: const EdgeInsets.all(4),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            PhosphorIcons.regular.archive,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(width: 2),
          Text(
            data.stock.toString(),
            style: TextStyles.w600.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }

  Positioned _buildGridContentOrder(MenuEntity data) {
    return Positioned(
      right: 2,
      top: 4,
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.orange100, shape: BoxShape.circle),
        width: 20,
        height: 20,
        alignment: Alignment.center,
        child: Text(
          data.order.toString(),
          style: TextStyles.w600
              .copyWith(fontSize: 10, color: AppColors.orange400),
        ),
      ),
    );
  }

  Container _buildGridContentImage(MenuEntity data) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.grey300,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      height: 128,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 4),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Image.asset(data.thumbnail, fit: BoxFit.fitHeight),
      ),
    );
  }

  Container _buildFilterViewBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(children: [
        FilterViewBar(
          isActive: true,
          icon: PhosphorIcons.regular.squaresFour,
          onTap: () {},
        ),
        FilterViewBar(
          isActive: false,
          icon: PhosphorIcons.regular.list,
          onTap: () {},
        ),
        FilterViewBar(
          isActive: false,
          icon: Icons.table_bar_outlined,
          onTap: () {},
        ),
      ]),
    );
  }

  Container _buildFilterCategoryMenu() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(children: [
        FilterCategoryMenu(
          text: "Semua",
          onTap: () {},
          isActive: false,
        ),
        FilterCategoryMenu(
          text: "Favorite",
          onTap: () {},
          prefixIcon: PhosphorIcons.duotone.star,
          isActive: true,
        ),
        FilterCategoryMenu(
          text: "Ricebowl",
          onTap: () {},
          prefixIcon: PhosphorIcons.duotone.bowlFood,
          isActive: false,
        ),
        FilterCategoryMenu(
          text: "Seafood",
          onTap: () {},
          prefixIcon: PhosphorIcons.duotone.fishSimple,
          isActive: false,
        ),
        FilterCategoryMenu(
          text: "Kopi",
          onTap: () {},
          prefixIcon: PhosphorIcons.duotone.coffee,
          isActive: false,
        ),
        FilterCategoryMenu(
          text: "Es Krim",
          onTap: () {},
          prefixIcon: PhosphorIcons.duotone.iceCream,
          isActive: false,
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:slicing_ui/presentation/screen/transaction_fragment.dart';
import 'package:slicing_ui/utils/app_colors.dart';
import 'package:slicing_ui/utils/data_dummy.dart';

import '../../domain/entity/menu_entity.dart';

import '../../domain/entity/order_entity.dart';
import '../../utils/text_styles.dart';
import '../widgets/button_outline.dart';
import 'main_menu_fragment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final menuList = List<MenuEntity>.from(
      DataDummy.menuJson.map((x) => MenuEntity.fromJson(x)));
  final orderList = List<OrderEntity>.from(
      DataDummy.orderJson.map((x) => OrderEntity.fromJson(x)));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Column(children: [
              _buildMainHeader(),
              Expanded(
                child: MainMenuFragment(menuList: menuList),
              ),
            ]),
          ),
          Expanded(
            flex: 1,
            child: Column(children: [
              _buildTrxHeader(),
              Expanded(
                child: TransactionFragment(orderList: orderList),
              )
            ]),
          ),
        ]),
      ),
    );
  }

  Container _buildTrxHeader() {
    return Container(
      color: Colors.white,
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Text(
          "Pesanan Saat Ini",
          style: TextStyles.w700.copyWith(fontSize: 16),
        ),
        const Spacer(),
        ButtonOutline(
          text: "List Pesanan",
          prefixIcon: PhosphorIcons.light.scroll,
          onTap: () {},
        ),
      ]),
    );
  }

  Container _buildMainHeader() {
    return Container(
      color: Colors.white,
      height: 68,
      child: Material(
        color: Colors.transparent,
        child: Row(children: [
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(PhosphorIcons.regular.list),
          ),
          const SizedBox(width: 10),
          Text(
            "Transaksi Kasir",
            style: TextStyles.w700.copyWith(fontSize: 16),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              PhosphorIcons.duotone.bell,
              color: AppColors.grey500,
              size: 16,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            margin: const EdgeInsets.only(left: 4, right: 20),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: 265,
            height: 36,
            child: Row(children: [
              Icon(
                PhosphorIcons.light.magnifyingGlass,
                color: AppColors.grey500,
                size: 16,
              ),
              const SizedBox(width: 12),
              Text(
                "Cari Produk",
                style: TextStyles.w600.copyWith(color: AppColors.grey500),
              )
            ]),
          )
        ]),
      ),
    );
  }
}

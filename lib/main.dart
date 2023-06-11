import 'package:flutter/material.dart';

import 'presentation/screen/home_screen.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.orange400,
        fontFamily: "PlusJakartaSans",
      ),
      home: const HomeScreen(),
    );
  }
}

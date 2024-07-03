import 'package:flipflow_app/features/home/presentation/providers/layout_controller.dart';
import 'package:flipflow_app/features/home/presentation/widgets/nav_bar/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutController>(builder: (context, data, child) {
      final provider = context.read<LayoutController>();
      return Scaffold(
        body: provider.getScreen(),
        bottomNavigationBar: const CustomNavigationBar(),
      );
    });
  }
}

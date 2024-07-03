import 'package:flipflow_app/features/coach/presentation/provider/coach_module_controller.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/coach_module_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_gradiant_widget.dart';

class CoachLayout extends StatelessWidget {
  const CoachLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoachModuleController>(
      builder: (context, data, child) {
        return Scaffold(
          body: CustomGradiantContainer(child: data.screens[data.navIndex]),
          bottomNavigationBar: const CoachModuleNavBar(),
        );
      },
    );
  }
}

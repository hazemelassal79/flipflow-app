import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:flipflow_app/core/widgets/custom_text_button.dart';
import 'package:flipflow_app/features/onboarding/presentation/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServiceLocator.get<OnBoardingController>(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            CustomTextButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(Routes.loginRoute);
                  ServiceLocator.get<OnBoardingController>()
                      .setOnBoardingViewd();
                },
                buttonText: AppStrings.skip)
          ],
        ),
        body: const CustomGradiantContainer(child: OnBoardingViewBody()),
      ),
    );
  }
}

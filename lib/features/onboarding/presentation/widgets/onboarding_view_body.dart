import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/features/onboarding/domain/onboarding_model.dart';
import 'package:flipflow_app/features/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:flipflow_app/features/onboarding/presentation/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final introductionKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Consumer<OnBoardingController>(
        builder: (context, controller, child) {
          return IntroductionScreen(
            key: introductionKey,
            globalBackgroundColor: Colors.transparent,
            pages:
                controller.pages.map((model) => _getPageModel(model)).toList(),
            showDoneButton: false,
            showNextButton: false,
            controlsPadding: EdgeInsets.only(bottom: hight * 0.15),
            bodyPadding: const EdgeInsets.symmetric(vertical: AppPadding.p26),
            customProgress: CustomProgressIndicator(
              onPressed: () => _onButtonPressed(controller),
              value: controller.indicatorValue,
            ),
            onChange: (index) {
              controller.changeIndex(index);
            },
          );
        },
      ),
    );
  }

  PageViewModel _getPageModel(OnBoardingModel model) {
    return PageViewModel(
        title: model.title,
        body: model.body,
        decoration: PageDecoration(
            titleTextStyle: StylesManager.bold24,
            bodyTextStyle: StylesManager.regular16),
        image: Image.asset(
          fit: BoxFit.cover,
          model.imagePath,
        ));
  }

  void _animateTo(int page) {
    final controller = introductionKey.currentState?.controller;
    controller?.animateToPage(page,
        curve: Curves.easeIn,
        duration:
            const Duration(milliseconds: UiConstants.onBoardingScrollDuration));
  }

  void _onButtonPressed(OnBoardingController controller) {
    if (controller.currentIndex == controller.pages.length - 1) {
      controller.setOnBoardingViewd();
      GoRouter.of(context).pushReplacement(Routes.loginRoute);
      return;
    }
    controller.increamentIndex();
    _animateTo(controller.currentIndex);
  }
}

import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/payment/paymob_web_view_body.dart';
import 'package:flutter/material.dart';

class PaymobWebView extends StatelessWidget {
  const PaymobWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.paymobPayment,
          style: StylesManager.bold20,
        ),
        leading: const CustomBackArrow(),
      ),
      body: const PaymobWebViewBody(),
    );
  }
}

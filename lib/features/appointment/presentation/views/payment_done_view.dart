import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/payment_done/payment_done_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDoneView extends StatelessWidget {
  const PaymentDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomGradiantContainer(
            child: SafeArea(child: PaymentDoneViewBody())));
  }
}

import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

class PaymobWebViewBody extends StatelessWidget {
  const PaymobWebViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
      final cubit = context.read<AppointmentCubit>();
      if (cubit.paymentKey != null) {
        return Stack(
          children: [
            InAppWebView(
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                cubit.setIndicator(progress);
              },
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                  useOnDownloadStart: true,
                ),
              ),
              onConsoleMessage: (controller, consoleMessage) {},
              onWebViewCreated: (InAppWebViewController controller) {},
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final url = navigationAction.request.url;
                if (url?.queryParameters['success'] == "true") {
                  await cubit.setPaymentStatus(onSuccess: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).pop();
                    GoRouter.of(context).push(Routes.paymentDoneRoute);
                  });
                  return NavigationActionPolicy.CANCEL;
                }
                return NavigationActionPolicy.ALLOW;
              },
              initialUrlRequest:
                  URLRequest(url: Uri.parse(cubit.getWebViewUrl())),
            ),
            cubit.progress < 1
                ? LinearProgressIndicator(value: cubit.progress)
                : const SizedBox(),
          ],
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

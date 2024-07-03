import 'package:dio/dio.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/api_constants.dart';
import 'package:flipflow_app/core/utils/failure.dart';

class PaymobService {
  late final Dio _dio;

  PaymobService() {
    _dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstants.baseUrl,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  Future<String> createPaymentKey({
    required Map<String, dynamic> userBillingData,
  }) async {
    final token = await _getAuthToken();
    final orderId = await _getOrderId(
      token: token,
      priceInCents: userBillingData["price"],
    );
    final String paymentKey = await _getPaymentKey(
      token: token,
      orderId: orderId.toString(),
      userBillingData: userBillingData,
    );

    return paymentKey;
  }

  Future<String> _getPaymentKey({
    required String token,
    required String orderId,
    required Map<String, dynamic> userBillingData,
  }) async {
    final price = userBillingData.remove("price");
    final response = await _dio.post(
      ApiConstants.paymentKeyEndpoint,
      data: {
        "auth_token": token,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": orderId,
        "billing_data": userBillingData,
        "currency": "EGP",
        "integration_id": ApiConstants.cardIntegrationId,
        "lock_order_when_paid": "false"
      },
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Failure(
          message: response.statusMessage ?? AppStrings.failedTransaction);
    }
    return response.data['token'];
  }

  Future<String> _getAuthToken() async {
    final response = await _dio.post(ApiConstants.authTokenEndpoint, data: {
      "api_key": ApiConstants.apiKey,
    });
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Failure(
          message: response.statusMessage ?? AppStrings.failedTransaction);
    }
    return response.data['token'];
  }

  Future<int> _getOrderId({
    required String token,
    required String priceInCents,
  }) async {
    final response = await _dio.post(ApiConstants.orderIdEndpoint, data: {
      "auth_token": token,
      "delivery_needed": "false",
      "amount_cents": priceInCents,
      "currency": "EGP",
      "items": [],
    });
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Failure(
          message: response.statusMessage ?? AppStrings.failedTransaction);
    }
    return response.data['id'];
  }
}

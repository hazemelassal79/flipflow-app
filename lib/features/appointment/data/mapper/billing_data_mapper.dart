import 'package:flipflow_app/features/appointment/data/models/user_billing_data_model.dart';
import 'package:flipflow_app/features/appointment/domain/entities/user_billing_data_entity.dart';

extension BillingDataMapper on UserBillingDataEntity {
  UserBillingDataRequest toModel() {
    return UserBillingDataRequest(
        name: name, email: email, phoneNumber: phoneNumber, price: price);
  }
}

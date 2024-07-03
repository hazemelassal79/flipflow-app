class UserBillingDataRequest {
  final String name;
  final String email;
  final String phoneNumber;
  final String price;

  UserBillingDataRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": name,
      "price": price,
      "email": email,
      "phone_number": phoneNumber,
      "apartment": "NA",
      "floor": "NA",
      "street": "NA",
      "building": "NA",
      "shipping_method": "NA",
      "postal_code": "NA",
      "city": "NA",
      "country": "NA",
      "last_name": "NA",
      "state": "NA"
    };
  }
}

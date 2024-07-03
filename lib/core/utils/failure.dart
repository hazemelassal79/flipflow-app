import 'package:flipflow_app/core/res/strings_manager.dart';

class Failure implements Exception {
  Failure({required this.message});
  final String message;

  factory Failure.connectionFailure() {
    return Failure(message: AppStrings.connectionError);
  }

  @override
  toString() => message;
}

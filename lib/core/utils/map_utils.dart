import 'dart:developer';

import 'package:flipflow_app/core/entities/location_entity.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  static Future<void> openMap(context, LocationEntity location) async {
    final googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';
    log(googleUrl);
    final uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      showSnackBar(context, text: AppStrings.mapError);
    }
  }
}

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:

import 'controllers/global_controller.dart';
import 'theme/app_colors.dart';

enum HelpType {
  listView,
  generalView,
}

enum Status {
  failed,
  success,
  waiting,
}

/// Get timestamp into a string
String getTimeStamp() {
  final currentTime = DateTime.now();
  final String timeStamp =
      '${currentTime.day}${currentTime.month}${currentTime.year}${currentTime.hour}${currentTime.minute}${currentTime.second}${currentTime.microsecond}';
  return timeStamp;
}

/// Display a snackbar popup
showSnackbar(String message, Status status) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: status == Status.success
        ? AppColors.greenColor
        : status == Status.failed
            ? AppColors.redColor
            : AppColors.blueColor,
    webBgColor: status == Status.success
        ? AppColors.greenHexColor
        : status == Status.failed
            ? AppColors.redHexColor
            : AppColors.blueHexColor,
    textColor: AppColors.whiteColor,
  );
}

/// Open the URL
launchUrl(String url) async {
  debugPrint(url);
  if (await canLaunchUrl(Uri.parse(url))) {
    launchUrl(url);
  } else {
    showSnackbar('Error Processing Request', Status.failed);
  }
}

String processDropdownData(String data, String dropdownPrefix) {
  List<String> splittedData = data.split('.');
  String newData = (splittedData.length > 1 ? splittedData[1] : splittedData[0])
      .replaceAll(dropdownPrefix, '');
  if (newData[0] == '_') {
    newData = newData.substring(1);
  }
  return newData;
}

String processDropdownId(String data) => data.toString().split('.').first;

bool isDarkMode() =>
    Get.find<GlobalController>().box.read('isDarkMode') ?? false;

import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';
// import 'package:flutter_html/flutter_html.dart';

class Utils {
  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // static Future<String?> getDeviceId() async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     // import 'dart:io'
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  //   } else if (Platform.isAndroid) {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;
  //     return androidDeviceInfo.id; // unique ID on Android
  //   } else {
  //     return "";
  //   }
  // }

  static String getDateString(NepaliDateTime date) {
    return NepaliDateFormat("yyyy-MM-dd", Language.english).format(date);
  }

  static String getEnglishDateString(DateTime date) {
    return DateFormat("yyyy-MM-dd", 'en_US').format(date);
  }

  // static String parseHtmlString(String htmlString) {
  //   return parse(htmlString).body?.text ?? "";
  // }

  // static Widget mainparseHtmlWidget(String htmlString) {
  //   return Html(
  //     data: htmlString,
  //   );
  // }

  static NepaliDateTime convertToNepali(String dateTimeString) {
    DateFormat inputFormat = DateFormat("yyyy/M/d");
    return NepaliDateTime.parse(inputFormat.parse(dateTimeString).toString());
  }

  static String formatTimetoNepali(String timeString) {
    DateFormat inputFormat = DateFormat("HH:mm:ss");
    DateFormat outputFormat = DateFormat("HH:mm");

    DateTime time = inputFormat.parse(timeString);
    String formattedTime = NepaliUnicode.convert(outputFormat.format(time));
    return formattedTime;
  }
}

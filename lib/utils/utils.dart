import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Utils {
  static String indianFormatCurrency(num amount) {
    var indiaCurrency = NumberFormat("####,##,##,##0.00", "en_US");
    return "₹ ${indiaCurrency.format(amount)}"; //10,00,00,000.00
  }

  static String indianFormatCurrencyWithoutDecimal(num amount) {
    var indiaCurrency = NumberFormat("####,##,##,##0", "en_US");
    return "₹ ${indiaCurrency.format(amount)}"; //10,00,00,000
  }

  static String capitalizeName(String name) {
    return name.split(' ').map((e) => e.capitalizeFirst).join(' ');
  }

  static Future<String> appVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  static String dateFormatWithoutTime(DateTime? date) {
    if (date != null) {
      return DateFormat('EEE, dd MMMM yyyy').format(date);
    } else {
      return '';
    }
  }

  static bool isNullOrEmpty(String? value) {
    if (value == null || value.trim() == 'null' || value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

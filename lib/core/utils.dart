import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_board/core/extensions.dart';

class Utils {
  static String toDateString(DateTime? date, {String format = 'yyyy-MM-dd'}) {
    if (date == null) return '';
    final formatter = DateFormat(format);
    return formatter.format(date);
  }

  static String? formatDate(DateTime? date, {String format = 'dd.MM.yyyy'}) {
    if (date == null) return null;
    return DateFormat(format).format(date);
  }

  static DateTime? parseDate(dynamic date,
      {String format = 'yyyy-MM-ddTHH:mm:ss'}) {
    if (date == null || date == '') return null;

    try {
      return DateFormat(format).parse('$date');
    } catch (e) {
      debugPrint('Unable to parse date ($date): $e');
    }
    return null;
  }

  static String toTimerFormat(int seconds) {
    Duration duration = Duration(seconds: seconds);
    return duration.toHoursMinutesSeconds();
  }
}

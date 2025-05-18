import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String stringFormat(String format) => DateFormat(format).format(this);
  String get timeFormat => stringFormat('HH:mm');
  String get dateFormat => stringFormat('dd/MM/yyyy');

  bool isSameDate(DateTime date) {
    return date.year == year && date.month == month && date.day == day;
  }
}

import 'package:intl/intl.dart';

class DateUtils {
  static String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }
}

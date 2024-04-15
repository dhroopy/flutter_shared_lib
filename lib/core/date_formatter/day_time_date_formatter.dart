import 'package:intl/intl.dart';

import 'date_formatter.dart';

class DayTimeDateFormater extends DateFormatter {
  @override
  String formateDate(DateTime? date) {
    if (date != null) {
      return DateFormat("EEE, HH:mm a").format(date);
    }
    return "";
  }
}

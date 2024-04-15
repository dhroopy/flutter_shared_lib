import 'package:intl/intl.dart';

import 'date_formatter.dart';

class DayDateFormatter extends DateFormatter {
  @override
  String formateDate(DateTime? date) {
  
    if (date != null) {
      return DateFormat("EEEE,").format(date);
    }
    return "";
  }
}

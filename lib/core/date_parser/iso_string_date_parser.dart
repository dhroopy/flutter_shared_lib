

import '../validator/validator.dart';
import 'date_parser.dart';

class IsoStringDateParser extends DateParser {
  @override
  DateTime? parseDate(String? date) {
    if (StringValidator(text: date).isValid()) {
      return DateTime.parse(date!);
    }
    return null;
  }
}

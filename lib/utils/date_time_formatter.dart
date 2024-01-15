import 'package:intl/intl.dart';

final DateFormat _yearDateFormat = DateFormat.y();

DateFormat _birstDateDateFormat(String locale) => DateFormat.yMMMd(locale);

class DateTimeFormatter {
  DateTimeFormatter._();

  static String year(DateTime date) => _yearDateFormat.format(date);

  static String birthDate(DateTime date, String locale) => _birstDateDateFormat(locale).format(date);
}

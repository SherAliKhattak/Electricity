
import 'package:intl/intl.dart';

class HomeScreenUtils{
 DateTime? toDateTime(dynamic dateValue) {
    if (dateValue is DateTime) {
      return dateValue;
    } else if (dateValue is String) {
      return DateTime.parse(dateValue);
    }  else {
      return null;
    }
  }

static String formatDateTime(DateTime time)
  {
      String formattedCurrentDate = DateFormat('HH:mm:ss').format(time);
      return formattedCurrentDate;
  } 
static String formattoDay(DateTime time)
  {
      String formattedCurrentDate = DateFormat('EEEE').format(time);
      return formattedCurrentDate;
  } 
int getWeekOfMonth(DateTime date) {
  int firstDayOfMonth = DateTime(date.year, date.month, 1).weekday;
  int dayOfMonth = date.day;
  return ((dayOfMonth + firstDayOfMonth - 1) / 7).ceil();
}
}
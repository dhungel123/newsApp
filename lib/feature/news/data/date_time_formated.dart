import 'package:intl/intl.dart';

class DateTimeFormatted {
  static String convertDateTime(String datetimeStr) {
    String formattedDateTime = '';

    try {
      // Convert the datetime string to a DateTime object.
      DateTime datetime = DateTime.parse(datetimeStr);

      // Calculate the time difference between the current time and the given time.
      DateTime now = DateTime.now();
      Duration difference = now.difference(datetime);

      if (difference.inHours == 0) {
        // Less than an hour ago
        formattedDateTime = 'just now';
      } else if (difference.inHours == 1) {
        formattedDateTime = '1 hour ago';
      } else if (difference.inHours >= 24) {
        // 24 hours or more ago
        formattedDateTime = '1 day ago';
      } else {
        // More than 1 hour and less than 24 hours ago
        formattedDateTime = '${difference.inHours} hours ago';
      }
    } catch (e) {
      formattedDateTime = '';
    }

    return formattedDateTime;
  }
}

class dteTimeFormat{

  static DateTime parseDateTime(String dateTimeString) {
    List<String> parts = dateTimeString.split("T");
    List<String> dateParts = parts[0].split("-");
    List<String> timeParts = parts[1].split(":");
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    int second = int.parse(timeParts[2].substring(0, 2));

    return DateTime.utc(year, month, day, hour, minute, second);
  }

  String formatDateTime(DateTime dateTime) {
    String daySuffix = dateTime.day == 1 || dateTime.day == 21 || dateTime.day == 31
        ? "st"
        : dateTime.day == 2 || dateTime.day == 22
        ? "nd"
        : dateTime.day == 3 || dateTime.day == 23 ? "rd" : "th";
    String month = getMonthAbbreviation(dateTime.month);
    String formattedTime = formatTime(dateTime.hour, dateTime.minute);

    return "$month ${dateTime.day}$daySuffix ${dateTime.year}, $formattedTime";
  }

  String getMonthAbbreviation(int month) {
    List<String> months = [
      "", // index 0 is empty since month index starts from 1
      "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];

    if (month >= 1 && month <= 12) {
      return months[month];
    } else {
      return "";
    }
  }

  String formatTime(int hour, int minute) {
    String period = hour >= 12 ? "P.M." : "A.M.";
    hour = hour % 12 == 0 ? 12 : hour % 12;
    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');

    return "$formattedHour:$formattedMinute $period";
  }
}
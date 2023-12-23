class DateTimeHelper {
  static String getHours(DateTime dateTime) =>
      dateTime.hour < 10 ? '0${dateTime.hour}' : dateTime.hour.toString();

  static String getMinutes(DateTime dateTime) =>
      dateTime.minute < 10 ? '0${dateTime.minute}' : dateTime.minute.toString();

  static String getDay(DateTime dateTime) =>
      dateTime.day < 10 ? '0${dateTime.day}' : dateTime.day.toString();

  static String getMonth(DateTime dateTime) =>
      dateTime.month < 10 ? '0${dateTime.month}' : dateTime.month.toString();
}

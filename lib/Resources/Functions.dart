import 'package:flutter/material.dart';

getMQHeight(BuildContext context) => MediaQuery.of(context).size.height;
getMQWidth(BuildContext context) => MediaQuery.of(context).size.width;

String getShortDateFormat({@required DateTime date}) =>
    "${date.day >= 10 ? date.day : "0${date.day}"}-${date.month >= 10 ? date.month : "0${date.month}"}-${date.year}";
materialPageRoute(
        {@required BuildContext context, @required Widget destination}) =>
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => destination));

String getMonthFormat(int date, {bool isFullMonthFormat = false}) {
  String month;
  switch (date) {
    case 1:
      month = isFullMonthFormat ? 'January' : 'Jan';
      break;
    case 2:
      month = isFullMonthFormat ? 'February' : 'Feb';
      break;
    case 3:
      month = isFullMonthFormat ? 'March' : 'Mar';
      break;
    case 4:
      month = isFullMonthFormat ? 'April' : 'Apr';
      break;
    case 5:
      month = isFullMonthFormat ? 'May' : 'May';
      break;
    case 6:
      month = isFullMonthFormat ? 'June' : 'Jun';
      break;
    case 7:
      month = isFullMonthFormat ? 'July' : 'Jul';
      break;
    case 8:
      month = isFullMonthFormat ? 'August' : 'Aug';
      break;
    case 9:
      month = isFullMonthFormat ? 'September' : 'Sep';
      break;
    case 10:
      month = isFullMonthFormat ? 'October' : 'Oct';
      break;
    case 11:
      month = isFullMonthFormat ? 'November' : 'Nov';
      break;
    case 12:
      month = isFullMonthFormat ? 'December' : 'Dec';
      break;
  }
  return month;
}

String getWeekdayFormat(int weekday) {
  String weekdayFormat;
  switch (weekday) {
    case 1:
      weekdayFormat = 'Mon';
      break;
    case 2:
      weekdayFormat = 'Tue';
      break;
    case 3:
      weekdayFormat = 'Wed';
      break;
    case 4:
      weekdayFormat = 'Thu';
      break;
    case 5:
      weekdayFormat = 'Fri';
      break;
    case 6:
      weekdayFormat = 'Sat';
      break;
    case 7:
      weekdayFormat = 'Sun';
      break;
  }
  return weekdayFormat;
}

getDetailedDateFormat({@required DateTime dateTime}) =>
    "${getWeekdayFormat(dateTime.weekday)} ${getMonthFormat(dateTime.month)} ${dateTime.hour}:${dateTime.minute}:${dateTime.second} ${dateTime.year}";

String getCountDown(DateTime dateTime) {
  int _leftMinites = dateTime.difference(DateTime.now()).inMinutes % 60;
  int _leftHour = dateTime.difference(DateTime.now()).inHours % (24);
  int _leftDays = dateTime.difference(DateTime.now()).inDays;
  return "${_leftDays > 0 ? (_leftDays.toString()) + " day" + (_leftDays > 1 ? "s" : "") : ""}" +
      " ${_leftHour > 0 ? (_leftHour.toString()) + " Hr" + (_leftHour > 1 ? "s" : "") : ""}" +
      " ${_leftMinites > 0 ? (_leftMinites.toString()) + " min" + (_leftMinites > 1 ? "s" : "") : ""}" +
      " left...";
}

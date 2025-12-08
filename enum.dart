enum Days { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void main(List<String> args) {
  Days today = Days.monday;

 

  switch (today) {
    case Days.monday:
      print('Monday');
      break;

    case Days.tuesday:
      print('Tuesday');
      break;

    case Days.wednesday:
      print('Wednesday');
      break;

    case Days.thursday:
      print('Thursday');
      break;

    case Days.friday:
      print('Friday');
      break;

    case Days.saturday:
      print('Saturday');
      break;

    case Days.sunday:
      print('Sunday');
      break;
  }
}

String getDay (String dateString) {
  const daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  DateTime date = DateTime.parse(dateString);
  
  return daysOfTheWeek[date.weekday - 1];
}
enum ScheduleType { study, work }

class Schedule {
  final ScheduleType type;
  final String day;
  final startTime;
  final endTime;
  final String description;
  final String title;

  Schedule({
    required this.type,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.title,
  });
}

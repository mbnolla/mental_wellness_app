import 'package:hive/hive.dart';

part 'self_care_entry.g.dart';

@HiveType(typeId: 1)
class SelfCareEntry {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final List<String> completedTasks;

  SelfCareEntry({required this.date, required this.completedTasks});
}

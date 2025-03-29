import 'package:ehho/core/models/activity.dart';

List<Map<String, dynamic>> listData = [
  {
    'activity_id': 1,
    'user_id': 'user123',
    'activity': 2,
    'distance': 10.5,
    'time': 120,
    'day': '2025-03-29 08:30',
  },
  {
    'activity_id': 2,
    'user_id': 'user123',
    'activity': 1,
    'distance': 5.0,
    'time': 60,
    'day': '2025-03-29 09:00',
  },
  {
    'activity_id': 11,
    'user_id': 'user123',
    'activity': 0,
    'distance': 5.0,
    'time': 60,
    'day': '2025-03-29 09:00',
  },
];

List<Activity> activityListTest = Activity.listInit(
  listData,
); // listInitで複数のActivityを作成

import 'package:ehho/core/models/activity.dart';
import 'package:ehho/core/utils/generate_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ehho/core/services/activity_service.dart';

class ActivityHistoryList extends ConsumerWidget {
  const ActivityHistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityService = ref.read(activityServiceProvider);

    return SizedBox(
      height: 300,
      child: FutureBuilder<List<ActivityGet>>(
        future: activityService.getActivity(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('エラーが発生しました: ${snapshot.error}'));
          }
          final activities = snapshot.data ?? [];
          if (activities.isEmpty) {
            return const Center(child: Text('アクティビティがありません'));
          }

          return Scrollbar(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 400),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    final activity = activities[index];
                    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
                    DateTime formattedDateTime = dateFormat.parse(activity.day);

                    IconData icon;
                    if (formattedDateTime.hour >= 6 &&
                        formattedDateTime.hour < 9) {
                      icon = Icons.wb_sunny;
                    } else if (formattedDateTime.hour >= 9 &&
                        formattedDateTime.hour < 18) {
                      icon = Icons.access_time;
                    } else {
                      icon = Icons.nights_stay;
                    }

                    String imagePath = generateImagePath(activity.activity);

                    return ListTile(
                      leading: Image.asset(
                        imagePath,
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activity.distance.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                formatDuration(activity.time),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(children: [Icon(icon), Text(activity.day)]),
                        ],
                      ),
                      onTap: () {
                        // 詳細画面へ遷移（未実装）
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

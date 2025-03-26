import 'package:ehho/presentation/widgets/history/activity_history_list.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [AppBar(), ActivityHistoryList()]),
      ),
    );
  }
}

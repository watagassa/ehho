import 'package:flutter/material.dart';

// アクティビティコンテナ
class MetricContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const MetricContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      child: child,
    );
  }
}


// 下のデータ３つ
class MetricItem extends StatelessWidget {
  final String value;
  final String label;

  const MetricItem({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
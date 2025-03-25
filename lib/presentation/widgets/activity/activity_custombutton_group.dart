// custom_button_group.dart
import 'package:flutter/material.dart';
import 'package:ehho/presentation/widgets/custom_button.dart';

class ModeButtonGroup extends StatefulWidget {
  const ModeButtonGroup({super.key});

  @override
  State<ModeButtonGroup> createState() => _ModeButtonGroupState();
}

class _ModeButtonGroupState extends State<ModeButtonGroup> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          label: "ランニング",
          imagePath: 'assets/images/ehho_running.png',
          isSelected: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        CustomButton(
          label: "ウォーキング",
          imagePath: 'assets/images/ehho_walking.png',
          isSelected: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        CustomButton(
          label: "サイクリング",
          imagePath: 'assets/images/ehho_cycling.png',
          isSelected: selectedIndex == 2,
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
          },
        ),
      ],
    );
  }
}
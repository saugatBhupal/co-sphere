import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(color: AppColors.plaster, width: 1)),
        title: Text(
          "Leslie Alexander",
          style: _textTheme.titleLarge!.copyWith(
              fontWeight: FontThickness.medium, color: AppColors.black),
        ),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}

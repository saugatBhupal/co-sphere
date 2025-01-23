import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/message_tile.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/search_bar.dart';
import 'package:flutter/material.dart';

class ChatLogsScreen extends StatelessWidget {
  const ChatLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          iconTheme: const IconThemeData(color: AppColors.black),
          centerTitle: true,
          title: const Center(child: SearchTextField()),
          shape: const Border(
              bottom: BorderSide(color: AppColors.plaster, width: 0.6)),
        ),
      ),
      body: const Column(
        children: [
          MessageTile(unread: false),
          MessageTile(unread: true),
          MessageTile(unread: true),
        ],
      ),
    );
  }
}

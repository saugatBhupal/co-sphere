import 'package:cosphere/src/core/widgets/appbar/search_field_appbar.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/message_tile.dart';
import 'package:flutter/material.dart';

class ChatLogsScreen extends StatelessWidget {
  const ChatLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchFieldAppbar(),
      body: Column(
        children: [
          MessageTile(unread: false),
          MessageTile(unread: true),
          MessageTile(unread: true),
        ],
      ),
    );
  }
}

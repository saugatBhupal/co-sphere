import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/message_text_field.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/received_tile.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/sent_tile.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      double targetPosition = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        targetPosition,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              children: const [
                ReceivedTile(
                  message:
                      "Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow",
                ),
                ReceivedTile(message: "Hello nice to meet you my friend?"),
                SentTile(
                    message:
                        "Whats up my bro! Whats up my bro! Whats up my bro! "),
                SentTile(message: "Hello nice to meet you my friend?"),
                SentTile(
                    message:
                        "Whats up my bro! Whats up my bro! Whats up my bro! "),
                ReceivedTile(
                  message:
                      "Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow",
                ),
                ReceivedTile(message: "Hello nice to meet you my friend?"),
                SentTile(
                    message:
                        "Whats up my bro! Whats up my bro! Whats up my bro! "),
                SentTile(message: "Hello nice to meet you my friend?"),
                SentTile(
                    message:
                        "Whats up my bro! Whats up my bro! Whats up my bro! "),
                ReceivedTile(
                  message:
                      "Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow Hello nice to meet you my friend? Whats up my bro! Thank you! I will see you tomorrow",
                ),
                ReceivedTile(message: "Hello nice to meet you my friend?"),
                SentTile(
                    message:
                        "Whats up my bro! Whats up my bro! Whats up my bro! "),
                SentTile(message: "Hello nice to meet you my friend?"),
                SentTile(
                    message:
                        "Whats up my bro! Whats up my bro! Whats up my bro! "),
              ],
            ),
          ),
          MessageTextField(),
        ],
      ),
    );
  }
}

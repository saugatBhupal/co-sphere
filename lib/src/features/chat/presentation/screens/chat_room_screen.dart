import 'package:cosphere/src/config/socket_config/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/message_text_field.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/received_tile.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/sent_tile.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ScrollController _scrollController = ScrollController();
  final SocketService _socketService = SocketService();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    _setupSocketListeners();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _setupSocketListeners() {
    final socket = _socketService.socket;
    if (socket == null) return;

    socket.on("receiveMessage", (message) {
      setState(() {
        messages.add({"text": message["content"], "isSent": false});
      });
      _scrollToBottom();
    });
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      _socketService.socket?.emit("sendMessage", message);
      setState(() {
        messages.add({"text": message, "isSent": true});
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 350),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void dispose() {
    _socketService.socket?.off("receiveMessage");
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
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return message["isSent"]
                    ? SentTile(message: message["text"])
                    : ReceivedTile(message: message["text"]);
              },
            ),
          ),
          MessageTextField(
              // onSend: (text) => _sendMessage(text),
              ),
        ],
      ),
    );
  }
}

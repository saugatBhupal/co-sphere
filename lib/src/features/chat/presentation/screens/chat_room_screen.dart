import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/features/chat/data/dto/send_message_request_dto.dart';
import 'package:cosphere/src/features/chat/data/models/mapppers/message_mappers.dart';
import 'package:cosphere/src/features/chat/data/models/message_api_model.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosphere/src/config/socket_config/socket_service.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/features/chat/presentation/viewmodel/chat_bloc.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/message_text_field.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/received_tile.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/sent_tile.dart';

class ChatRoomScreen extends StatefulWidget {
  final ChatScreensArgs chatScreensArgs;
  const ChatRoomScreen({
    super.key,
    required this.chatScreensArgs,
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ScrollController _scrollController = ScrollController();
  final SocketService _socketService = SocketService();
  late final TextEditingController _textController;
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(
        GetMessages(conversationID: widget.chatScreensArgs.conversationID));
    _setupSocketListeners();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    _textController = TextEditingController();
  }

  void _setupSocketListeners() {
    final socket = _socketService.socket;
    if (socket == null) return;

    socket.on("receiveMessage", (data) {
      if (data["conversationId"] == widget.chatScreensArgs.conversationID) {
        final message = MessageApiModel.fromJson(data).toDomain();
        setState(() {
          messages.add(message);
        });
        _scrollToBottom();
      }
    });
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
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(color: AppColors.plaster, width: 1)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.popAndPushNamed(context, AppRoutes.chatLogs,
                arguments: widget.chatScreensArgs.user);
          },
        ),
        title: Text(
          widget.chatScreensArgs.receipient.fullname,
          style: _textTheme.titleLarge!.copyWith(
              fontWeight: FontThickness.medium, color: AppColors.black),
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocListener<ChatBloc, ChatState>(
              listener: (context, state) {
                if (state is GetMessageSuccess) {
                  setState(() {
                    messages =
                        state.messages.map((message) => message).toList();
                  });
                  _scrollToBottom();
                }
                if (state is SendMessageSuccess) {
                  setState(() {
                    messages.add(state.message);
                  });
                  _scrollToBottom();
                }
                if (state is GetMessageFailed) {
                  buildToast(toastType: ToastType.error, msg: state.message);
                }
                if (state is SendMessageFailed) {
                  buildToast(toastType: ToastType.error, msg: state.message);
                }
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return message.sender.uid != widget.chatScreensArgs.user.uid
                      ? ReceivedTile(
                          message: message.content,
                          sent: extractTime(message.sent),
                          profileImage:
                              widget.chatScreensArgs.receipient.profileImage,
                        )
                      : SentTile(
                          message: message.content,
                          sent: extractTime(message.sent),
                          profileImage:
                              widget.chatScreensArgs.user.profileImage,
                        );
                },
              ),
            ),
          ),
          MessageTextField(
            controller: _textController,
            onSend: (text) {
              if (text.isNotEmpty) {
                context.read<ChatBloc>().add(
                      SendMessage(
                        dto: SendMessageRequestDto(
                          conversationID: widget.chatScreensArgs.conversationID,
                          content: text,
                          senderID: widget.chatScreensArgs.user.uid,
                        ),
                      ),
                    );
                _textController.clear();
              }
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/appbar/search_field_appbar.dart';
import 'package:cosphere/src/features/chat/presentation/viewmodel/chat_bloc.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/message_tile.dart';

class ChatLogsScreen extends StatelessWidget {
  final User user;
  const ChatLogsScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchFieldAppbar(),
      body: BlocProvider(
        create: (context) =>
            sl<ChatBloc>()..add(GetAllConversation(uid: user.uid)),
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is GetConversationLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetConversationFailed) {
              buildToast(toastType: ToastType.error, msg: state.message);
            }
            if (state is GetAllConversationSuccess) {
              if (state.conversation.isEmpty) {
                return const Center(child: Text("No Conversations Found"));
              }
              return ListView.builder(
                itemCount: state.conversation.length,
                itemBuilder: (context, index) {
                  final conversation = state.conversation[index];
                  return MessageTile(
                    unread: true,
                    user: user,
                    conversation: conversation,
                  );
                },
              );
            }
            return const Center(child: Text("Something went wrong!"));
          },
        ),
      ),
    );
  }
}

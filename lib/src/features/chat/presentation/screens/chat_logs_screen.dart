import 'package:cosphere/src/config/screen_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosphere/src/config/app_routes/app_routes.dart';
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
      body: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is GetConversationFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is GetConversationSuccess) {
            buildToast(
                toastType: ToastType.success, msg: "Conversation Initialized");
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.chatRoom, (route) => false,
                arguments: ChatScreensArgs(
                    conversationID: "67b199361951254f65c360f5",
                    user: user,
                    receipient: User.initial()));
          }
        },
        child: BlocProvider(
          create: (context) =>
              sl<ChatBloc>()..add(GetAllConversation(uid: user.uid)),
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is GetConversationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetAllConversationSuccess) {
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<ChatBloc>().add(const GetConversation(members: [
      //           "67b05057151bd4f0a904a0ba",
      //           "67b1a95051c826113195e095"
      //         ]));
      //   },
      //   splashColor: AppColors.genie,
      //   shape: const CircleBorder(),
      //   elevation: 2,
      //   backgroundColor: AppColors.plaster,
      //   child: SvgPicture.asset(
      //     AppIcons.chat,
      //   ),
      // ),
    );
  }
}

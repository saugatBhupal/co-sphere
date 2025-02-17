import 'dart:convert';

import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/features/chat/data/datasources/remote/chat_remote_datasource.dart';
import 'package:cosphere/src/features/chat/data/models/conversation_api_model.dart';
import 'package:cosphere/src/features/chat/data/models/message_api_model.dart';
import 'package:dio/dio.dart';

class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  final Dio dio;

  ChatRemoteDatasourceImpl({required this.dio});
  @override
  Future<ConversationApiModel> getConversation(List<String> members) async {
    try {
      var res = await dio.get(
        ApiEndpoints.createConversation,
        data: {"members": members},
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      if (res.statusCode == 200) {
        return ConversationApiModel.fromJson(res.data);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ConversationApiModel>> getAllConversations(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getAllConversations}$uid");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => ConversationApiModel.fromJson(json))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ConversationApiModel> getConversationById(String conversationID) {
    throw UnimplementedError();
  }

  @override
  Future<List<MessageApiModel>> getMessagesFromConversation(
      String conversationID) {
    throw UnimplementedError();
  }

  @override
  Future<MessageApiModel> sendMessage(MessageApiModel message) {
    throw UnimplementedError();
  }
}

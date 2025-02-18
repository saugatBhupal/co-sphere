import 'dart:convert';
import 'package:equatable/equatable.dart';

class SendMessageRequestDto extends Equatable {
  final String conversationID;
  final String content;
  final String senderID;

  const SendMessageRequestDto({
    required this.conversationID,
    required this.content,
    required this.senderID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'conversationID': conversationID,
      'content': content,
      'senderID': senderID,
    };
  }

  factory SendMessageRequestDto.fromMap(Map<String, dynamic> map) {
    return SendMessageRequestDto(
      conversationID: map['conversationID'] as String,
      content: map['content'] as String,
      senderID: map['senderID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendMessageRequestDto.fromJson(String source) =>
      SendMessageRequestDto.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [conversationID, content, senderID];
}

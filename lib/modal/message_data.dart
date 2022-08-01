import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
class MessagesData {
  final String senderName;
  final String message;
  final String messagesData;
  final String dateMessage;
  final NetworkImage profilePicture;
  const MessagesData({
    required this.senderName,
    required this.message,
    required this.messagesData,
    required this.dateMessage,
    required this.profilePicture,
  });
}

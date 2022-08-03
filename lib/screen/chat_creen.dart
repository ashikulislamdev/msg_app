import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:msg_app/modal/message_data.dart';
import 'package:msg_app/theme.dart';
import 'package:msg_app/widgets/avator.dart';
import 'package:msg_app/widgets/icon_button.dart';

class ChatScreen extends StatelessWidget {

  static Route route(MessagesData data) => MaterialPageRoute(
    builder: (context) => ChatScreen(
      messagesData: data,
    )
  );

  const ChatScreen({
    Key? key,
    required this.messagesData,
  }) : super(key: key);

  final MessagesData messagesData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            icon: const Icon(Icons.arrow_back_ios_new)
          ),
        ),
        title: _AppBarTitle(
          messagesData: messagesData
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: IconBorder(
                icon: Icons.video_camera_front, 
                onTap: () {
                  
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: IconBorder(
                icon: Icons.phone, 
                onTap: () {
                  
                },
              ),
            ),
          ),
        ],
      ),
      body: null,
    );
  }
}


class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    Key? key,
    required this.messagesData,
  }) : super(key: key);

  final MessagesData messagesData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(url: messagesData.profilePicture),
        const SizedBox(width: 16,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messagesData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 16,),
              const Text(
                "Online",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green,)
              ),
            ],
          )
        )
      ],
    );
  }
}

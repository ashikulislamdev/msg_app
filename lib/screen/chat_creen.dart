import 'package:flutter/material.dart';

import 'package:msg_app/modal/message_data.dart';
import 'package:msg_app/theme.dart';
import 'package:msg_app/widgets/action_btn.dart';
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
        title: AppBarTitle(
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
      body: Column(
        children: const [
          Expanded(child: _DemoMessage()),
          SentActionBar()
        ],
      ),
    );
  }
}


class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
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


class _DemoMessage extends StatelessWidget {
  const _DemoMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _DataLabel(label: "Yesterday"),
        MessageTile(
          message: "Hi, White",
          message_data: "10:25 AM",
        ),

        SelfMsg(
          message: "Hlw, Ashikul", 
          message_data: "10.25 AM"
        ),
        MessageTile(
          message: "How are you doing?", 
          message_data: "10.26 AM"
        ),
        SelfMsg(message: "Yeah, I'm okay, How about you??", message_data: "10.27 AM")
      ],
    );
  }
}

class _DataLabel extends StatelessWidget {
  const _DataLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textFaded),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.message,
    required this.message_data,
  }) : super(key: key);

  final String message;
  final String message_data;
  
  static const _borderRadius = 26.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius:  const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                message_data,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelfMsg extends StatelessWidget {
  const SelfMsg({
    Key? key,
    required this.message,
    required this.message_data,
  }) : super(key: key);

  final String message;
  final String message_data;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_borderRadius),
                bottomRight: Radius.circular(_borderRadius),
                bottomLeft: Radius.circular(_borderRadius)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
              child: Text(message, style: const TextStyle(color: AppColors.textLigth),),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                message_data,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                )
              ),
            )
        ],
      ),
    );
  }
}


class SentActionBar extends StatelessWidget {
  const SentActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2,
                  color: Theme.of(context).dividerColor,
                )
              )
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.camera_alt),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: TextField(
                style: TextStyle(fontSize: 14,),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type something",
                ),
              ),
            )
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12, right:24, top: 22),
            child: GlowingActionButton(
              color: AppColors.secondary, 
              icon: Icons.send_rounded, 
              onPressed: () {
                
              },
            ),
          )
        ],
      )
    );
  }
}
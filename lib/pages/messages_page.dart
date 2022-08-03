import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:msg_app/helpers.dart';

import 'package:msg_app/modal/message_data.dart';
import 'package:msg_app/theme.dart';
import 'package:msg_app/widgets/avator.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index){
              final Faker faker = Faker();
              final date = Helpers.randomDate();

              return _MessageTitle(
                messagesData: MessagesData(
                  senderName: faker.person.name(), 
                  message: faker.lorem.sentence(), 
                  messagesData: '$date', 
                  dateMessage: Jiffy(date).fromNow(), 
                  profilePicture: Helpers.randomPicture()
                )
              );
            }
          )
        )
      ],
    );
  }
}


class _MessageTitle extends StatelessWidget {
  const _MessageTitle({
    Key? key,
    required this.messagesData,
  }) : super(key: key);

  final MessagesData messagesData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Avatar.medium(url: messagesData.profilePicture),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Text(
                      messagesData.senderName, 
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, 
                        wordSpacing: 1.5, letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20, 
                    child: Text(messagesData.message, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, color: AppColors.textFaded),)
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 4,),
                  Text(
                    messagesData.dateMessage.toUpperCase(),
                    style: const TextStyle(fontSize: 11, letterSpacing: -0.2, fontWeight: FontWeight.w600, color: AppColors.textFaded, ),
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    width: 18, height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text("1", style: TextStyle(fontSize: 10, color: AppColors.textLigth),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

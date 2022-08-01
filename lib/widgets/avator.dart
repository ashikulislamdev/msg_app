import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.radius,
    required this.url,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
    required this.url,
  }) : radius = 16, super(key: key);
  
  const Avatar.medium({
    Key? key,
    required this.url,
  }) : radius = 22, super(key: key);
  
  const Avatar.large({
    Key? key,
    required this.url,
  }) : radius = 44, super(key: key);

  final double radius;
  final NetworkImage url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(faker.image.image(width: 60, height: 60, keywords: ['people', 'nature'], random: true)),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}

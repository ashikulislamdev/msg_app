import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';

abstract class Helpers{   //it's from internet
  static final random = Random();

  static NetworkImage randomPicture(){
    //final randomInt = random.nextInt(1000);
    return NetworkImage(faker.image.image(width: 80, height: 80, keywords: ['people', 'nature'], random: true));
  }

  static DateTime randomDate(){
    final random = Random();
    final currentDate = DateTime.now();

    return currentDate.subtract(Duration(seconds: random.nextInt(200000)));
  }
}
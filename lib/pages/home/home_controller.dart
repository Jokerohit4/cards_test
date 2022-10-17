import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../app.dart';

class HomeController extends GetxController {
  //holds current bank Name
  String? bankNameValue;

  //holds current card NAme
  String? cardNameValue;

  //holds all cardData of the app
  List<Cards> cardData = [];

  //text editing controllers
  TextEditingController boxOne = TextEditingController();
  TextEditingController boxTwo = TextEditingController();
  TextEditingController boxThree = TextEditingController();
  TextEditingController boxFour = TextEditingController();

  //random object of Random class
  var random = Random();

  // List of banks in our dropdown menu
  final List<String> banks = [
    'Bank 1',
    'Bank 2',
    'Bank 3',
    'Bank 4',
    'Bank 5',
  ];

  // List of card names in our dropdown menu
  final List<String> cardNames = [
    'Card 1',
    'Card 2',
    'Card 3',
    'Card 4',
    'Card 5',
  ];

  //if the value of the dropdown gets changed
  onChange(value, int i) {
    if (i == 1) {
      bankNameValue = value;
    } else {
      cardNameValue = value;
    }
  }

  //on clicking the add card button
  onClickAddCard(BuildContext context) {
    //offers
    var offer1 = random.nextInt(60).toString() + '% off';
    var offer2 = random.nextInt(60).toString() + '% off';
    var offer3 = random.nextInt(60).toString() + '% off';
    if (boxOne.text.length == boxTwo.text.length &&
        boxThree.text.length == boxFour.text.length &&
        boxFour.text.length == boxOne.text.length &&
        boxOne.text.length == 3 &&
        bankNameValue != null &&
        cardNameValue != null) {
      //adds a new card
      cardData.add(
        Cards(
          bankNameValue!,
          cardNameValue!,
          boxOne.text + boxTwo.text + boxThree.text + boxFour.text,
          Offers(offer1, offer2, offer3),
        ),
      );
      //reinitialising
      bankNameValue = null;
      cardNameValue = null;
      boxOne.clear();
      boxTwo.clear();
      boxThree.clear();
      boxFour.clear();
      //return to homepage
      Navigator.pop(context);
    }
  }
}

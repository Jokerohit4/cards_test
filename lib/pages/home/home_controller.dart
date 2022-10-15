import 'package:get/get.dart';

class HomeController extends GetxController {
  String? bankNameValue;
  String? cardNameValue;
  String? select;
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

  onChange(value, int i) {
    if (i == 1)
      bankNameValue = value;
    else
      cardNameValue = value;
  }
}

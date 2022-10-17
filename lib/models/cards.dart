import 'package:cards_test/app.dart';

class Cards {
  Cards(this.bankName, this.cardName, this.cardNumber, this.discounts);
  final String bankName;
  final String cardName;
  final String cardNumber;
  final Offers discounts;
}

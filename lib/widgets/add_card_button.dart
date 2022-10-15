import 'package:flutter/material.dart';

import '../app.dart';

class AddCardButton extends StatelessWidget {
  const AddCardButton(
      {Key? key,
      required this.banks,
      required this.cardNames,
      required this.bankNameValue,
      required this.cardNameValue})
      : super(key: key);

  final List<String> banks;
  final List<String> cardNames;

  final String? bankNameValue;
  final String? cardNameValue;

  Widget addCardButton() => SizedBox(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 123,
              vertical: 13,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            backgroundColor: ColorsValue.highlightingColor,
          ),
          onPressed: () {},
          child: Text(
            StringConstants.addCard,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorsValue.backgroundColor,
            ),
          ),
        ),
      );

  cardNoBoxes() => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child: Row(
          children: [
            for (int i = 0; i < 4; i++)
              Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: Material(
                  elevation: 2,
                  child: Container(
                    width: 70,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: ColorsValue.backgroundColor,
                      boxShadow: const [
                        BoxShadow(
                          color: ColorsValue.shadow,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 1.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.5, vertical: 10),
                    child: const TextField(
                      decoration: InputDecoration.collapsed(hintText: 'xxx'),
                    ),
                  ),
                ),
              )
          ],
        ),
      );

  addCard(context) => showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2.0,
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringConstants.bankName),
              DropDown(
                hintText: StringConstants.bankName,
                items: banks,
                selectedValue: bankNameValue,
              ),
              Text(StringConstants.cardName),
              DropDown(
                  hintText: StringConstants.cardName,
                  items: cardNames,
                  selectedValue: cardNameValue),
              Text(StringConstants.cardNumber),
              cardNoBoxes(),
              addCardButton(),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: ColorsValue.highlightingColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: () => addCard(context),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          StringConstants.addCard,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

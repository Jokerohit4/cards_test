import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app.dart';

//on pressing the add card button
//opens the bottom sheet and allows to enter card details
class AddCardButton extends StatelessWidget {
  AddCardButton({
    Key? key,
    required this.banks,
    required this.cardNames,
  }) : super(key: key);

  final List<String> banks;
  final List<String> cardNames;

  final HomeController controller = Get.put(HomeController());

  //the add card button on bottom sheet
  Widget addCardButton(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SizedBox(
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
            onPressed: () {
              controller.onClickAddCard(context);
              controller.update();
            },
            child: Text(
              StringConstants.addCard,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorsValue.backgroundColor,
              ),
            ),
          ),
        ),
      );

  //on pressing the floating add card opens up
  addCard(context) => showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2.0,
        isScrollControlled: true,
        builder: (BuildContext context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(StringConstants.bankName),
                DropDown(
                  hintText: StringConstants.bankName,
                  items: banks,
                ),
                Text(StringConstants.cardName),
                DropDown(
                  hintText: StringConstants.cardName,
                  items: cardNames,
                ),
                Text(StringConstants.cardNumber),
                Row(
                  children: [
                    CustomTextField(
                      textController: controller.boxOne,
                    ),
                    CustomTextField(
                      textController: controller.boxTwo,
                    ),
                    CustomTextField(
                      textController: controller.boxThree,
                    ),
                    CustomTextField(
                      textController: controller.boxFour,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
                addCardButton(context),
              ],
            ),
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

import 'package:flutter/material.dart';

import '../app.dart';

//textField ui or the ui for feeding the card number
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.textController, this.textInputAction})
      : super(key: key);
  final textController;
  final textInputAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          padding: const EdgeInsets.symmetric(horizontal: 22.5, vertical: 10),
          child: TextField(
            decoration: const InputDecoration.collapsed(
              hintText: 'xxx',
            ),
            controller: textController,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }
}

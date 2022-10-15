import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app.dart';

class DropDown extends StatelessWidget {
  DropDown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.selectedValue,
  }) : super(key: key);
  final String hintText;
  final List items;
  final String? selectedValue;
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 30),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    hintText,
                    style: Styles.textButtonStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: Styles.textButtonStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            value: items == controller.banks
                ? controller.bankNameValue
                : controller.cardNameValue,
            onChanged: (value) {
              items == controller.banks
                  ? controller.onChange(value, 1)
                  : controller.onChange(value, 2);
              controller.update();
            },
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            iconSize: 25,
            iconEnabledColor: ColorsValue.highlightingColor,
            iconDisabledColor: ColorsValue.highlightingColor,
            buttonHeight: 42,
            buttonWidth: 319.97,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonElevation: 2,
            buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsValue.backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: ColorsValue.shadow,
                    blurRadius: 70.0,
                  ),
                ]),
            itemHeight: 40,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            offset: const Offset(-20, 0),
          ),
        ),
      );
    });
  }
}

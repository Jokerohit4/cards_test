import 'package:cards_test/app.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Cards> cards = [];

  HomeController controller = Get.put(HomeController());

  final List<BottomNavigationBarItem> _itemsNaviagtion = [
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.home,
        color: ColorsValue.highlightingColor,
      ),
      label: StringConstants.home,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(AssetConstants.friendsIcon),
      label: StringConstants.friends,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(AssetConstants.requestIcon),
      label: StringConstants.requests,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(AssetConstants.cardsIcon),
      label: StringConstants.cards,
    ),
    BottomNavigationBarItem(
      icon: const Icon(
        Icons.notifications,
        color: ColorsValue.inactiveIconColor,
      ),
      label: StringConstants.notification,
    ),
  ];

  ////rewards Card UI
  Widget rewardsCard(String imageUrl, String rewardName, String cardCost,
      String offer, String duration) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: ColorsValue.primaryColor.withOpacity(0.04),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      height: 180,
      width: 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 100,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rewardName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  cardCost,
                  style: const TextStyle(
                    color: ColorsValue.highlightingColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(offer),
                Text(duration),
              ],
            ),
          )
        ],
      ),
    );
  }

  ////card UI
  Widget card(String cardHolderName, String bankLogoUrl, String cardNo,
      String cardCompanyLogoUrl, String cardType) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        top: 35,
        bottom: 20,
      ),
      margin: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorsValue.primaryColor.withOpacity(0.1),
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      height: 248,
      width: 235,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cardHolderName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 50),
            child: Image.network(
              bankLogoUrl,
              width: 92,
            ),
          ),
          Text(
            cardNo,
            style: const TextStyle(
              color: ColorsValue.secondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Text(
            cardType,
            style: const TextStyle(
              color: ColorsValue.secondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 23),
          Image.network(
            cardCompanyLogoUrl,
            width: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsValue.primaryColor,
          ),
          onPressed: () {},
        ),
        title: Text(
          StringConstants.myCards,
          style: const TextStyle(
            fontSize: 20,
            color: ColorsValue.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: ColorsValue.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 25.0,
          ),
          child: ListView(
            children: [
              Text(
                StringConstants.manageYourCards,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) => card(
                      StringConstants.johnJacob,
                      AssetConstants.hdfcLogo,
                      StringConstants.cardNos,
                      AssetConstants.masterCardLogo,
                      StringConstants.regaliaPlatinum),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: ColorsValue.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsValue.secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              rewardsCard(
                AssetConstants.loungeAccessImage,
                StringConstants.travelRewards,
                StringConstants.freePass,
                StringConstants.loungeAccess,
                StringConstants.duration,
              ),
              GetBuilder<HomeController>(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text(
                              StringConstants.bankName,
                              style: Styles.textButtonStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: controller.banks
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
                      value: controller.select,
                      onChanged: (value) {
                        //controller.onChange(value);
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
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: AddCardButton(
        banks: controller.banks,
        cardNames: controller.cardNames,
        bankNameValue: controller.bankNameValue,
        cardNameValue: controller.cardNameValue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _itemsNaviagtion,
        selectedItemColor: ColorsValue.highlightingColor,
        unselectedItemColor: ColorsValue.secondaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}

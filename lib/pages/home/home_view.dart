import 'package:cards_test/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//the starting page of the app
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //to notify for updates
  int forUpdates = 0;

  //controller
  HomeController controller = Get.put(HomeController());

  //pages to go to
  final List<BottomNavigationBarItem> _itemsNavigation = [
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
  Widget rewardsCard(String imageUrl, String rewardName, String offerPercent,
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
                  offerPercent,
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
  Widget card(String cardHolderName, String bankLogo, String cardNo,
      String cardCompanyLogoUrl, String cardType) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        top: 35,
        bottom: 20,
        right: 30,
      ),
      margin: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorsValue.primaryColor.withOpacity(0.1),
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      height: 248,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardHolderName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              Image.asset(
                AssetConstants.editCardIcon,
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 50),
              child: bankLogo == AssetConstants.hdfcLogo
                  ? Image.network(
                      bankLogo,
                      width: 92,
                    )
                  : Text(bankLogo)),
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
          child: GetBuilder<HomeController>(builder: (_) {
            return ListView(
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
                    child: controller.cardData.isNotEmpty
                        ? PageView.builder(
                            onPageChanged: (index) {
                              forUpdates = index;
                              controller.update();
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.cardData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return card(
                                  StringConstants.johnJacob,
                                  controller.cardData[index].bankName,
                                  controller.cardData[index].cardNumber,
                                  AssetConstants.masterCardLogo,
                                  controller.cardData[index].cardName);
                            })
                        : card(
                            StringConstants.johnJacob,
                            AssetConstants.hdfcLogo,
                            StringConstants.cardNos,
                            AssetConstants.masterCardLogo,
                            StringConstants.regaliaPlatinum)),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 2.8),
                  child: SizedBox(
                    width: 400,
                    height: 18,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.cardData.isNotEmpty
                            ? controller.cardData.length
                            : 1,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: (forUpdates == index)
                                  ? ColorsValue.primaryColor
                                  : ColorsValue.secondaryColor,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                rewardsCard(
                  AssetConstants.loungeAccessImage,
                  StringConstants.travelRewards,
                  controller.cardData.isEmpty
                      ? StringConstants.freePass
                      : controller.cardData[forUpdates].discounts.offer1,
                  StringConstants.loungeAccess,
                  StringConstants.duration,
                ),
                rewardsCard(
                  AssetConstants.electronicsImage,
                  StringConstants.travelRewards,
                  controller.cardData.isEmpty
                      ? StringConstants.freePass
                      : controller.cardData[forUpdates].discounts.offer2,
                  StringConstants.loungeAccess,
                  StringConstants.duration,
                ),
                rewardsCard(
                  AssetConstants.electronicsImage,
                  StringConstants.travelRewards,
                  controller.cardData.isEmpty
                      ? StringConstants.freePass
                      : controller.cardData[forUpdates].discounts.offer3,
                  StringConstants.loungeAccess,
                  StringConstants.duration,
                ),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: AddCardButton(
        banks: controller.banks,
        cardNames: controller.cardNames,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _itemsNavigation,
        selectedItemColor: ColorsValue.highlightingColor,
        unselectedItemColor: ColorsValue.secondaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}

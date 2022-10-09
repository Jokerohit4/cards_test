import 'package:cards_test/app.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final List<Cards> cards = [];

  List<BottomNavigationBarItem> _items = [
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
      decoration: BoxDecoration(
          color: ColorsValue.primaryColor.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      height: 180,
      width: 320,
      child: Column(
        children: [
          Image.asset(imageUrl),
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
            StringConstants.johnJacob,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 50),
            child: Image.network(
              AssetConstants.hdfcLogo,
              width: 92,
            ),
          ),
          Text(
            StringConstants.cardNo,
            style: const TextStyle(
              color: ColorsValue.secondryColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Text(
            StringConstants.regaliaPlatinum,
            style: const TextStyle(
              color: ColorsValue.secondryColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 23),
          Image.network(
            AssetConstants.masterCardLogo,
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
        title: Text(StringConstants.myCards),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 25.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      StringConstants.cardNo,
                      StringConstants.regaliaPlatinum,
                      AssetConstants.masterCardLogo),
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
                      color: ColorsValue.secondryColor,
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
                  StringConstants.duration),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorsValue.highlightingColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: () {},
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            StringConstants.addCard,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        items: _items,
      ),
    );
  }
}

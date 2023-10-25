import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';
import 'package:food_delivery_mobile_app/pages/tabs/chat_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/favorite_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/menu_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/order_page.dart';
import 'package:food_delivery_mobile_app/widget/item_menu_list.dart';
import 'package:food_delivery_mobile_app/widget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    const HomePageWidget(
      listItemName: [
        "Sushi",
        "Burger",
        "Pizza",
        "Spaghetti",
        "Salad",
      ],
      listImage: [
        "sushi_icon.png",
        "burger.png",
        "pizza.png",
        "spaghetti.png",
        "salad.png",
      ],
      listProductImage: [
        "sushi.png",
        "sushi.png",
        "sushi.png",
      ],
      listProductTitle: [
        "Special Sushi Full set",
        "Special Sushi Full set",
        "Special Sushi Full set",
      ],
      listProductPrice: [
        "\$42.00",
        "\$42.00",
        "\$42.00",
      ],
    ),
    const FavoriteFood(),
    const MenuPage(),
    const ChatPage(),
    const OrderPage(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        toolbarHeight: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.appBG,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 24),
                label: "",
                activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 24),
                label: "",
                activeIcon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets_outlined, size: 24),
                label: "",
                activeIcon: Icon(Icons.widgets)),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined, size: 24),
                label: "",
                activeIcon: Icon(Icons.chat)),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined, size: 24),
                label: "",
                activeIcon: Icon(Icons.list_alt)),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemBottomnavigationTapped,
          selectedItemColor: Colors.black),
      body: _children[_selectedIndex],
    );
  }

  void _onItemBottomnavigationTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    super.key,
    required this.listItemName,
    required this.listImage,
    required this.listProductImage,
    required this.listProductTitle,
    required this.listProductPrice,
  });

  final List listItemName;
  final List listImage;
  final List listProductImage;
  final List listProductTitle;
  final List listProductPrice;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Specials",
                      style: AppFontStyle.HEADLINE_MEDIUM,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: CircleAvatar(
                          child: Image(
                            image: AssetImage('img/BG.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 105),
                  child: Text(
                    "Delicious food for you",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontSize: 36),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listItemName.length,
                    itemBuilder: (context, int index) {
                      bool last = listItemName.length == (index + 1);
                      return Padding(
                        padding: EdgeInsets.only(right: last ? 0 : 34),
                        child: ItemMenuList(
                          child: listItemName[index],
                          image: listImage[index],
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listProductPrice.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        bool last = listProductPrice.length == (index + 1);
                        return Padding(
                          padding: EdgeInsets.only(right: last ? 0 : 20),
                          child: ProductCard(
                            image: listProductImage[index],
                            title: listProductTitle[index],
                            price: listProductPrice[index],
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

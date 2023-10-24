import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/constraint/fonts.dart';
import 'package:food_delivery_mobile_app/widget/item_menu_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List listItemName = [
    "Sushi",
    "Burger",
    "Pizza",
    "Spaghetti",
    "Salad",
  ];

  final List listImage = [
    "sushi_icon.png",
    "burger.png",
    "pizza.png",
    "spaghetti.png",
    "salad.png",
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      body: SafeArea(
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
                      scrollDirection: Axis.horizontal,
                      itemCount: listItemName.length,
                      itemBuilder: (context, index) {
                        return ItemMenuList(
                          child: listItemName[index],
                          image: listImage[index],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemBottomnavigationTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

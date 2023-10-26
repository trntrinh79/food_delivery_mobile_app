import 'package:flutter/material.dart';

class FavoriteFood extends StatefulWidget {
  const FavoriteFood({super.key});

  @override
  State<FavoriteFood> createState() => _FavoriteFoodState();
}

class _FavoriteFoodState extends State<FavoriteFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [Text("Favorite Page")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

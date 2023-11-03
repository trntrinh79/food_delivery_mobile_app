import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      DetailState detail = state as DetailState;
      var detailinfo = detail.place;
      return Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).goHome();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.black,
                      ),
                    ),
                    Text(detailinfo.name),
                    Image.network(
                      detailinfo.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Text(detailinfo.description),
                    Text(detailinfo.price.toString()),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

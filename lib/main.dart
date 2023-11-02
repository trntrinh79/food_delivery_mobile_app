import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit_logics.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/data/food_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(
          FoodData(),
        ),
        child: const AppCubitLogics(),
      ),
    );
  }
}

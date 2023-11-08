import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/auth/welcomepage.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit_logics.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/cubit/navigation_cubit.dart';
import 'package:food_delivery_mobile_app/data/food_data.dart';
import 'package:food_delivery_mobile_app/pages/others/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(
            data: FoodData(),
          ),
        ),
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: AppCubitLogics()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/auth/welcomepage.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/pages/tabs/main_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: ((context, state) {
          if (state is WelcomeState) {
            print("Welcome state");
            return const WelcomePage();
          }
          // if (state is DetailState) {
          //   return const DetailPage();
          // }
          if (state is LoadedState) {
            print("Loaded state");
            return const MainPage();
          }
          if (state is LoadingState) {
            print("Loading state");
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print("Error State");
            return Container();
          }
        }),
      ),
    );
  }
}

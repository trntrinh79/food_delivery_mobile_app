import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit/app_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _navigateToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3), () {
      BlocProvider.of<AppCubit>(context).goToWelcomePage();
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context); // Call the navigation method

    return Scaffold(
      // Customize your splash screen UI here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/logo.png"),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fast ",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF201A18),
                  ),
                ),
                Text(
                  "Food",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFEF8767),
                  ),
                ),
              ],
            ),
            const Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                color: Color(0xFFEF8767),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

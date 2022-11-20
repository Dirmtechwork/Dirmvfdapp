import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'env/routing.dart';
import 'screens/auth/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DirmVfdApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.kPrimaryColor,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      home: const LoginScreen(),
      getPages: AppRouting.ROUTES,
    );
  }
}

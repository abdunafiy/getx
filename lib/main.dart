import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitledaj/login_page.dart';
import 'package:untitledaj/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BottomNavbar',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        getPages: [
          GetPage(name: '/', page: () => LoginPage (),),
          GetPage(name: '/loginpage', page: () => LoginPage(),),
          GetPage(name: '/homepage', page: () => HomePage(),),
        ],
        );
    }
}





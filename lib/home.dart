import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitledaj/profile.dart';
import 'package:untitledaj/bottom_nav_controller.dart';
import 'package:untitledaj/history.dart';
import 'package:untitledaj/home_page.dart'; // Pastikan jalur ini benar

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menghubungkan UI ke pengontrol
    final BottomNavController bottomNavController = Get.put(BottomNavController());

    final List<Widget> menus = [Home(), History(), Profile()]; // History berada sebelum Profile

    return Obx(() {
      return Scaffold(
        body: menus[bottomNavController.selectedIndex.value], // Menampilkan halaman berdasarkan indeks yang dipilih
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu, // Pastikan ini mengarah ke metode yang benar
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.history_edu_outlined), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          ],
        ),
      );
    });
  }
}

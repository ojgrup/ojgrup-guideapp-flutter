import 'package:app_dasar/dashboard.dart'; // Asumsi impor ini benar
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panduan Wisata', // Tambahkan title
      debugShowCheckedModeBanner: false,
      theme: ThemeData( // Tambahkan tema dasar
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // DashboardPage adalah halaman utama aplikasi
      home: const DashboardPage(), 
    );
  }
}

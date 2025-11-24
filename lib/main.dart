import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart'; 
import 'theme/app_colors.dart'; // <--- KITA GUNAKAN INI
import 'dashboard.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, 
    statusBarIconBrightness: Brightness.light, 
  ));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panduan Wisata Hijau',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // --- TEMA DISEDERHANAKAN TOTAL ---
        // Kita hanya pakai warna hijau sebagai warna utama
        primaryColor: AppColors.primaryGreen,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryGreen,
          secondary: AppColors.darkGreen,
          background: AppColors.primaryWhite,
        ),
        scaffoldBackgroundColor: AppColors.primaryWhite, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryGreen, 
          foregroundColor: AppColors.primaryWhite, 
          elevation: 0, 
        ),
      ),
      // --- KEMBALI KE SPLASH SCREEN ---
      home: const SplashScreen(), 
    );
  }
}

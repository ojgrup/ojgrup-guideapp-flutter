import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'screens/splash_screen.dart'; // <--- DIKOMENTARI
import 'theme/app_colors.dart'; 
import 'dashboard.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  
  // Atur warna status bar untuk seluruh aplikasi
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
        // Tema Hijau dan Putih
        primaryColor: AppColors.primaryGreen,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(AppColors.primaryGreen.value, {
            50: AppColors.primaryGreen.withOpacity(0.1),
            100: AppColors.primaryGreen.withOpacity(0.2),
            500: AppColors.primaryGreen,
            900: AppColors.darkGreen,
          }),
        ).copyWith(
          secondary: AppColors.darkGreen,
          background: AppColors.primaryWhite,
        ),
        // BACKGROUND FULL PUTIH
        scaffoldBackgroundColor: AppColors.primaryWhite, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryGreen, 
          foregroundColor: AppColors.primaryWhite, 
          elevation: 0, 
        ),
      ),
      // --- Titik Masuk Utama LANGSUNG KE DASHBOARD ---
      home: const DashboardPage(), // <--- GANTI DI SINI
    );
  }
}

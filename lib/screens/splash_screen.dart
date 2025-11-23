import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dashboard.dart'; 
import '../theme/app_colors.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Menonaktifkan status bar dan navigation bar untuk efek full screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // Fungsi untuk mengaktifkan kembali UI dan navigasi
  void _navigateToDashboard() {
    // Mengaktifkan kembali status bar dan navigation bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
      overlays: SystemUiOverlay.values); 

    // Navigasi ke Dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold dengan background putih polos (Inherit dari theme)
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --- 1. Ikon Utama (Hijau) ---
            const Icon(
              Icons.travel_explore, // Menggunakan ikon yang relevan
              size: 100,
              color: AppColors.primaryGreen, 
            ),
            const SizedBox(height: 20),
            
            // --- 2. Judul Utama (Hijau Gelap) ---
            const Text(
              'Panduan Wisata Nusantara',
              style: TextStyle(
                fontSize: 28, // Sedikit lebih besar
                fontWeight: FontWeight.bold,
                color: AppColors.darkGreen, 
              ),
            ),
            const SizedBox(height: 10),
            
            // --- 3. Slogan ---
            const Text(
              'Temukan Destinasi Favoritmu',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54, // Warna abu-abu yang soft
              ),
            ),
            
            const SizedBox(height: 80),
            
            // --- 4. Tombol Masuk (Hijau) ---
            ElevatedButton(
              onPressed: _navigateToDashboard, 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: AppColors.primaryGreen, 
                // Menghilangkan bayangan (elevation: 0) untuk tampilan polos, jika belum disetel di tema
                elevation: 0, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Masuk',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryWhite, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

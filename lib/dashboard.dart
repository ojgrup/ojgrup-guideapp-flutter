import 'package:flutter/material.dart';
// Sesuaikan path import model, data, dan detail screen
import 'models/wisata.dart'; 
import 'data/dummy_data.dart';
import 'screens/detail_screen.dart'; 

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinasi Wisata 🗺️'),
      ),
      // Menggunakan ListView.builder untuk menampilkan daftar data
      body: ListView.builder(
        // ItemCount adalah jumlah data di daftar dummy
        itemCount: daftarWisata.length, 
        itemBuilder: (context, index) {
          final wisata = daftarWisata[index];
          // Menggunakan widget WisataItem untuk tampilan kartu
          return WisataItem(wisata: wisata);
        },
      ),
    );
  }
}

// -------------------------------------------------------------------

// --- Widget WisataItem (Tampilan Kartu per Item) ---

class WisataItem extends StatelessWidget {
  final Wisata wisata;

  const WisataItem({
    required this.wisata,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell( // InkWell memberikan efek sentuhan dan respons
        onTap: () {
          // Implementasi Navigasi ke DetailScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(wisata: wisata),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Bagian Kiri: Gambar Wisata dengan Hero Animation
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                  tag: wisata.id, // Tag unik untuk animasi transisi ke DetailScreen
                  child: Image.network(
                    wisata.urlGambar,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    // Tambahkan loading builder agar lebih stabil saat memuat gambar
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => const SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Icon(Icons.error, color: Colors.red)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Bagian Kanan: Detail Teks
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Nama
                    Text(
                      wisata.nama,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    // Lokasi
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text(
                          wisata.lokasi,
                          style: const TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Deskripsi Singkat
                    Text(
                      wisata.deskripsiSingkat,
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

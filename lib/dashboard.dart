import 'package:flutter/material.dart';
// Sesuaikan path import model dan data
import 'models/wisata.dart'; 
import 'data/dummy_data.dart';

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
      child: InkWell( // InkWell memberikan efek sentuhan
        onTap: () {
          // TODO: Di sini kita akan menempatkan navigasi ke halaman detail!
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Anda menekan ${wisata.nama}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              // Gambar Wisata
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  wisata.urlGambar,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              // Detail Teks
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      wisata.nama,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Lokasi: ${wisata.lokasi}',
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      wisata.deskripsiSingkat,
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,
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

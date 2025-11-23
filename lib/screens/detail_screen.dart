import 'package:flutter/material.dart';
import '../models/wisata.dart'; // Sesuaikan path jika model kamu di lokasi lain

class DetailScreen extends StatelessWidget {
  // DetailScreen memerlukan data Wisata yang akan ditampilkan
  final Wisata wisata; 

  const DetailScreen({
    required this.wisata,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar untuk header yang bisa ciut
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true, // AppBar tetap di atas saat digulir
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                wisata.nama,
                // Pastikan warna teks terlihat di atas gambar
                style: const TextStyle(shadows: [
                  Shadow(blurRadius: 5.0, color: Colors.black)
                ]),
              ),
              background: Hero( // Widget Hero untuk transisi gambar yang indah
                tag: wisata.id, // Tag harus unik untuk transisi
                child: Image.network(
                  wisata.urlGambar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // SliverList untuk konten detail
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Lokasi
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.teal),
                          const SizedBox(width: 8),
                          Text(
                            wisata.lokasi,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      // Judul Deskripsi
                      const Text(
                        'Deskripsi Lengkap',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      // Deskripsi Lengkap
                      Text(
                        wisata.deskripsiLengkap,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                      
                      // Tambahkan padding di bagian bawah agar konten tidak terpotong
                      const SizedBox(height: 80), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

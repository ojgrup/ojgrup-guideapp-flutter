class Wisata {
  final String id;
  final String nama;
  final String lokasi;
  final String deskripsiSingkat;
  final String deskripsiLengkap;
  final String urlGambar; // Untuk menampilkan gambar di daftar dan detail

  Wisata({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.deskripsiSingkat,
    required this.deskripsiLengkap,
    required this.urlGambar,
  });
}

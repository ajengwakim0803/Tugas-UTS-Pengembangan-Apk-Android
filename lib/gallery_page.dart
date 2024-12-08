import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Daftar gambar yang akan ditampilkan
    final List<String> imagePaths = [
      'assets/galery1.jpg',
      'assets/galery2.jpg',
      'assets/galery12.jpg',
      'assets/galery11.jpg',
      'assets/galery3.jpg',
      'assets/galery4.jpg',
      'assets/galery13.jpg',
      'assets/galery14.jpg',
    ];

    // Menentukan jumlah kolom berdasarkan ukuran layar
    int crossAxisCount = 2; // Default 2 kolom untuk perangkat mobile
    if (MediaQuery.of(context).size.width >= 600) {
      crossAxisCount = 3; // Menambah kolom untuk tablet atau desktop
    }
    if (MediaQuery.of(context).size.width >= 900) {
      crossAxisCount = 4; // Menambah kolom lebih banyak pada layar besar
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Galeri",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xFF6200EE),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // Responsif jumlah kolom
          crossAxisSpacing: 15, // Spasi antar kolom
          mainAxisSpacing: 15, // Spasi antar baris
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Aksi saat gambar di-tap (misalnya memperbesar gambar)
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Image.asset(imagePaths[index]),
                ),
              );
            },
            child: Card(
              elevation: 5, // Memberikan efek bayangan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Sudut melengkung pada Card
              ),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover, // Gambar menyesuaikan ukuran Card
              ),
            ),
          );
        },
      ),
    );
  }
}

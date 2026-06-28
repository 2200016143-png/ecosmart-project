import 'package:flutter/material.dart';

class KlasifikasiPage extends StatelessWidget {
  const KlasifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '♻️ Klasifikasi Sampah',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade700, Colors.teal.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih kategori sampah',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Kenali jenis sampah yang kamu temui agar bisa dibagi dan dikelola dengan benar.',
                    style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              title: '🟢 Sampah Organik',
              description: 'Sampah yang mudah membusuk dan terurai secara alami.',
              examples: ['Sisa makanan', 'Daun kering', 'Kulit buah', 'Sayuran'],
              color: Colors.green.shade100,
              accentColor: Colors.green.shade800,
            ),
            const SizedBox(height: 12),
            _buildCategoryCard(
              title: '🔵 Sampah Anorganik',
              description: 'Sampah yang tidak mudah membusuk dan butuh waktu lama untuk terurai.',
              examples: ['Botol plastik', 'Kaleng bekas', 'Kaca', 'Kardus/Kertas'],
              color: Colors.blue.shade100,
              accentColor: Colors.blue.shade800,
            ),
            const SizedBox(height: 12),
            _buildCategoryCard(
              title: '🔴 Sampah B3',
              description: 'Sampah yang mengandung zat berbahaya dan beracun bagi kesehatan dan lingkungan.',
              examples: ['Baterai bekas', 'Lampu TL', 'Cermin pecah', 'Kemasan detergen'],
              color: Colors.red.shade100,
              accentColor: Colors.red.shade800,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String description,
    required List<String> examples,
    required Color color,
    required Color accentColor,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: accentColor),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            Text(
              'Contoh:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: accentColor),
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: examples
                  .map((ex) => Chip(
                        label: Text(ex, style: const TextStyle(fontSize: 12)),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
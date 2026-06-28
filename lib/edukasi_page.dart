import 'package:flutter/material.dart';

class EdukasiPage extends StatelessWidget {
  const EdukasiPage({super.key});

  final List<Map<String, String>> materi3R = const [
    {
      'icon': '📉',
      'title': '1. Reduce (Mengurangi)',
      'desc': 'Mengurangi segala sesuatu yang mengakibatkan sampah. Ini adalah langkah paling utama dalam prinsip 3R.',
      'tips': 'Bawa botol minum sendiri, hindari kantong plastik sekali pakai, dan beli barang tanpa kemasan berlebih.',
    },
    {
      'icon': '🔄',
      'title': '2. Reuse (Menggunakan Kembali)',
      'desc': 'Menggunakan kembali sampah yang masih dapat digunakan untuk fungsi yang sama ataupun fungsi lainnya.',
      'tips': 'Gunakan sisi kertas yang masih kosong, manfaatkan kantong belanja bekas, atau ubah pakaian lama jadi kain lap.',
    },
    {
      'icon': '🏭',
      'title': '3. Recycle (Mendaur Ulang)',
      'desc': 'Mengolah kembali sampah menjadi barang atau produk baru yang bermanfaat.',
      'tips': 'Membuat kompos dari sampah organik, atau mengkreasikan botol plastik bekas menjadi pot tanaman hias.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '📚 Edukasi 3R',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade700, Colors.green.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pelajari prinsip 3R',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Langkah sederhana yang bisa kamu terapkan setiap hari untuk mengurangi sampah.',
                  style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(materi3R.length, (index) {
            final item = materi3R[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.teal.shade50),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.teal.shade100,
                        child: Text(item['icon']!, style: const TextStyle(fontSize: 24)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item['title']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['desc']!,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const Divider(height: 24, thickness: 1),
                  Text(
                    '💡 Tips Praktis:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['tips']!,
                    style: const TextStyle(fontSize: 14, color: Colors.black54, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
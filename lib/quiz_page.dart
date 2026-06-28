import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> soal = [
    {
      'pertanyaan': 'Manakah di bawah ini yang termasuk ke dalam contoh sampah organik?',
      'pilihan': ['Botol Plastik', 'Sisa Makanan & Daun', 'Baterai Bekas', 'Kaleng Minuman'],
      'jawaban': 1,
    },
    {
      'pertanyaan': 'Prinsip 3R yang memiliki arti "Mengurangi produksi sampah" sejak awal adalah...',
      'pilihan': ['Reduce', 'Reuse', 'Recycle', 'Replace'],
      'jawaban': 0,
    },
    {
      'pertanyaan': 'Sampah kaca, kaleng, dan plastik sebaiknya dibuang ke tempat sampah khusus jenis...',
      'pilihan': ['Organik', 'B3', 'Anorganik', 'Residu'],
      'jawaban': 2,
    },
    {
      'pertanyaan': 'Mengubah botol plastik bekas menjadi pot tanaman hias merupakan contoh penerapan dari...',
      'pilihan': ['Reduce', 'Reuse', 'Recycle', 'Replant'],
      'jawaban': 1,
    },
    {
      'pertanyaan': 'Baterai bekas dan lampu TL yang rusak termasuk dalam kategori sampah berbahaya yang disebut...',
      'pilihan': ['Sampah Rumah Tangga', 'Sampah B3', 'Sampah Organik', 'Sampah Anorganik'],
      'jawaban': 1,
    },
  ];

  int soalIndex = 0;
  int skor = 0;
  bool selesai = false;
  int? pilihanDipilih;

  void jawab(int index) {
    if (pilihanDipilih != null) return;
    setState(() {
      pilihanDipilih = index;
      if (index == soal[soalIndex]['jawaban']) {
        skor++;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (soalIndex + 1 < soal.length) {
          soalIndex++;
          pilihanDipilih = null;
        } else {
          selesai = true;
        }
      });
    });
  }

  void ulangi() {
    setState(() {
      soalIndex = 0;
      skor = 0;
      selesai = false;
      pilihanDipilih = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '🧠 Quiz Sampah',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: selesai ? _hasilQuiz() : _soalQuiz(),
    );
  }

  Widget _soalQuiz() {
    final currentSoal = soal[soalIndex];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.quiz, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Soal ${soalIndex + 1} dari ${soal.length}',
                  style: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: (soalIndex + 1) / soal.length,
            backgroundColor: Colors.blue.shade100,
            color: Colors.blue.shade600,
            minHeight: 8,
            borderRadius: BorderRadius.circular(999),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                currentSoal['pertanyaan'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(currentSoal['pilihan'].length, (index) {
            Color btnColor = Colors.white;
            if (pilihanDipilih != null) {
              if (index == currentSoal['jawaban']) {
                btnColor = Colors.green.shade200;
              } else if (pilihanDipilih == index) {
                btnColor = Colors.red.shade200;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btnColor,
                    foregroundColor: Colors.black87,
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => jawab(index),
                  child: Text(
                    currentSoal['pilihan'][index],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _hasilQuiz() {
    final nilai = (skor / soal.length * 100).toInt();
    String pesan = 'Yuk tingkatkan lagi!';
    if (nilai >= 80) {
      pesan = 'Hebat! Kamu sangat paham tentang sampah dan 3R.';
    } else if (nilai >= 60) {
      pesan = 'Bagus! Kamu sudah cukup memahami materi ini.';
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🎉 Quiz Selesai!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text(
                  'Skor Kamu:',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                Text(
                  '$nilai',
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.blue.shade700),
                ),
                Text(
                  'Berhasil menjawab $skor dari ${soal.length} soal',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Text(
                  pesan,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.green.shade700, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: ulangi,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Main Lagi', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  // List tips memasak
  final List<Map<String, dynamic>> tipsList = const [
    {
      'icon': Icons.local_fire_department,
      'title': 'Kontrol Api',
      'description': 'Gunakan api sedang agar masakan matang merata dan tidak gosong.',
      'color': Colors.orange
    },
    {
      'icon': Icons.kitchen,
      'title': 'Persiapkan Bahan',
      'description': 'Siapkan semua bahan sebelum memasak supaya lebih efisien.',
      'color': Colors.blue
    },
    {
      'icon': Icons.timer,
      'title': 'Perhatikan Waktu',
      'description': 'Masak sesuai waktu resep agar hasil optimal dan tidak overcooked.',
      'color': Colors.red
    },
    {
      'icon': Icons.emoji_food_beverage,
      'title': 'Gunakan Bumbu Segar',
      'description': 'Bumbu segar akan meningkatkan aroma dan cita rasa masakan.',
      'color': Colors.green
    },
    {
      'icon': Icons.health_and_safety,
      'title': 'Kebersihan',
      'description': 'Cuci bahan makanan dan peralatan sebelum digunakan.',
      'color': Colors.purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tips Memasak',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: tipsList.length,
                  itemBuilder: (context, index) {
                    final tip = tipsList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: tip['color'],
                          child: Icon(tip['icon'], color: Colors.white),
                        ),
                        title: Text(
                          tip['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(tip['description']),
                      ),
                    );
                  },
                ),
              ),
              // Ilustrasi tambahan
              Center(
                child: Column(
                  children: const [
                    SizedBox(height: 20),
                    Icon(Icons.emoji_food_beverage, size: 120, color: Colors.green),
                    SizedBox(height: 10),
                    Text(
                      'Selamat mencoba resep dan tipsnya!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

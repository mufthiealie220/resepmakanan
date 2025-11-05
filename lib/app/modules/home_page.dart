import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String nama = 'Mufthie Alie';
    const String nim = 'H1D023042';

    final List<Map<String, String>> resepList = [
      {
        'title': 'Nasi Goreng Spesial',
        'description': 'Nasi goreng dengan topping ayam, sosis, dan telur.'
      },
      {
        'title': 'Mie Ayam Jamur',
        'description': 'Mie lembut dengan ayam jamur dan kuah gurih.'
      },
      {
        'title': 'Sate Ayam Madura',
        'description': 'Sate ayam dengan bumbu kacang khas Madura.'
      },
    ];

    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Identitas Mahasiswa',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person, color: Colors.blueAccent),
                        const SizedBox(width: 8),
                        Text('Nama: $nama', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.badge, color: Colors.blueAccent),
                        const SizedBox(width: 8),
                        Text('NIM: $nim', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Daftar Resep Makanan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: resepList.length,
                itemBuilder: (context, index) {
                  final resep = resepList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/detail', arguments: {
                        'title': resep['title'],
                        'description': resep['description'],
                      });
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.fastfood,
                            color: Colors.blueAccent),
                        title: Text(resep['title']!),
                        subtitle: Text(resep['description']!),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Colors.blueAccent),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

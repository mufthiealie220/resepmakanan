import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_bottom_nav.dart';
import '../data/resep_data.dart'; // ⬅️ Import data resep

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String nama = 'Mufthie Alie';
    const String nim = 'H1D023042';

    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Card identitas mahasiswa
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
                        Text(
                          'Nama: $nama',
                          style: const TextStyle(fontSize: 16),
                        ),
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

            // Expanded GridView
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75, // tinggi card lebih tinggi dari lebar
                ),
                itemCount: resepList.length,
                itemBuilder: (context, index) {
                  final resep = resepList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/detail',
                        arguments: {
                          'title': resep['title'],
                          'description': resep['description'],
                          'image': resep['image'],
                        },
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image resep
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                resep['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Judul & deskripsi
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  resep['title']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  resep['description']!.split('\n').first,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
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

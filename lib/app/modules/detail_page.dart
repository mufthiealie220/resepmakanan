import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  // Fungsi bantu pisahkan bahan dan langkah dari deskripsi
  List<String> _extractSection(String description, String section) {
    final regex = RegExp('$section:\\n([\\s\\S]*?)(\\n🔥|\\Z)', multiLine: true);
    final match = regex.firstMatch(description);
    if (match != null) {
      return match.group(1)!.trim().split('\n- ').map((e) => e.replaceAll('- ', '')).toList();
    }
    return [];
  }

  List<String> _extractSteps(String description) {
    final regex = RegExp('🔥 \\*\\*Langkah-langkah:\\*\\*\\n([\\s\\S]*)', multiLine: true);
    final match = regex.firstMatch(description);
    if (match != null) {
      return match.group(1)!.trim().split('\n').map((e) => e.replaceAll(RegExp(r'^\d+\.\s'), '')).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? {};
    final String title = data['title'] ?? 'Tanpa Judul';
    final String description = data['description'] ?? 'Tidak ada deskripsi.';
    final String imagePath = data['image'] ?? '';

    final bahanList = _extractSection(description, '🍳 \\*\\*Bahan-bahan');
    final langkahList = _extractSteps(description);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagePath.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Deskripsi singkat (kalau ada)
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        description.split('🍳').first.trim(),
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Bahan-bahan
                  if (bahanList.isNotEmpty) ...[
                    const Text(
                      'Bahan-bahan:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ...bahanList.map((b) => Text('• $b', style: const TextStyle(fontSize: 16))).toList(),
                    const SizedBox(height: 20),
                  ],
                  // Langkah-langkah
                  if (langkahList.isNotEmpty) ...[
                    const Text(
                      'Langkah Memasak:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ...langkahList
                        .asMap()
                        .entries
                        .map((e) => Text('${e.key + 1}. ${e.value}', style: const TextStyle(fontSize: 16)))
                        .toList(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

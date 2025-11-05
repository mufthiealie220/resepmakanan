import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Tips Memasak',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                'Gunakan api sedang agar masakan matang merata dan tidak gosong.',
              ),
              SizedBox(height: 20),
              Icon(Icons.tips_and_updates, size: 120, color: Colors.green),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

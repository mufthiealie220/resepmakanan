import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Tentang Chef',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                'Chef Mufthie adalah pecinta kuliner tradisional yang gemar berbagi resep dari berbagai daerah di Indonesia.',
              ),
              SizedBox(height: 20),
              Icon(Icons.person, size: 120, color: Colors.blueAccent),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tentang Chef',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),

              // Card Profil Chef
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Foto / Avatar Chef
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images/chef_placeholder.png'),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Chef Mufthie',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Pecinta kuliner tradisional yang gemar berbagi resep dari berbagai daerah di Indonesia.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Highlight skill / keahlian
              const Text(
                'Keahlian:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _SkillIcon(
                    icon: Icons.local_fire_department,
                    label: 'Masakan Tradisional',
                    color: Colors.orange,
                  ),
                  _SkillIcon(
                    icon: Icons.emoji_food_beverage,
                    label: 'Minuman & Dessert',
                    color: Colors.green,
                  ),
                  _SkillIcon(
                    icon: Icons.restaurant_menu,
                    label: 'Kreasi Modern',
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

// Widget kecil untuk skill
class _SkillIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _SkillIcon({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

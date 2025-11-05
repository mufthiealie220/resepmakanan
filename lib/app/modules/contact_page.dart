import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import 'package:url_launcher/url_launcher.dart'; // untuk membuka email/IG

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Fungsi buka email
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'mufthiealie01@gmail.com',
      query: 'subject=Pertanyaan Resep&body=Halo Chef Mufthie,',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  // Fungsi buka Instagram
  void _launchInstagram() async {
    const url = 'https://instagram.com/alienyaturu';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

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
                'Kontak Chef',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 20),

              // Card Email
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.red),
                  title: const Text('Email'),
                  subtitle: const Text('mufthiealie01@gmail.com'),
                  trailing: const Icon(Icons.send, color: Colors.red),
                  onTap: _launchEmail,
                ),
              ),

              const SizedBox(height: 12),

              // Card Instagram
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.camera_alt, color: Colors.purple),
                  title: const Text('Instagram'),
                  subtitle: const Text('@alienyaturu'),
                  trailing: const Icon(Icons.open_in_new, color: Colors.purple),
                  onTap: _launchInstagram,
                ),
              ),

              const SizedBox(height: 30),
              // Ilustrasi besar
              Center(
                child: Column(
                  children: const [
                    Icon(Icons.contact_mail, size: 120, color: Colors.purple),
                    SizedBox(height: 10),
                    Text(
                      'Silakan hubungi Chef untuk tips memasak dan resep menarik!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
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

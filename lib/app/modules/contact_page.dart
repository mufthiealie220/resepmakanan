import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Kontak Chef',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                'Hubungi Chef Mufthie:\nEmail: chefmufthie@gmail.com\nInstagram: @chef.mufthie',
              ),
              SizedBox(height: 20),
              Icon(Icons.contact_mail, size: 120, color: Colors.purple),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

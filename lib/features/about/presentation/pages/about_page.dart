import 'package:flutter/material.dart';
import 'package:tlb_app/features/about/presentation/widgets/developer-card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Logo
              Image.asset(
                'lib/assets/images/logo.png', // Replace with your actual logo path
                height: 120,
              ),
              const SizedBox(height: 16),
              // Short Description
              const Text(
                'Three Lights Barbershop is dedicated to providing high-quality grooming services in a comfortable and modern environment. We aim to be your go-to barbershop for all your grooming needs.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              // Developers Section
              const Text(
                'Developers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Developer Cards
              DeveloperCard(
                name: 'Wildan Rizkia Noor Akhsal Hermawan',
                studentId: '2602200022',
                imagePath: 'lib/assets/images/foto-wildan-edited.png',
              ),
              const SizedBox(height: 16),
              DeveloperCard(
                name: 'Aldo Arista Wijaya Pujo Wibowo',
                studentId: '2602168974',
                imagePath: 'lib/assets/images/foto-aldo-edited.png',
              ),
              const SizedBox(height: 16),
              DeveloperCard(
                name: 'Daniel Mahendra Susanto',
                studentId: '2602102145',
                imagePath: 'lib/assets/images/foto-daniel.png',
              ),
              const SizedBox(height: 16),
              DeveloperCard(
                name: 'Kanz Abdillah Hamada',
                studentId: '2602170202',
                imagePath: 'lib/assets/images/foto-kanz.png',
              ),
              const SizedBox(height: 16),
              DeveloperCard(
                name: 'Bernardus Brahmantyo Budisusetyo',
                studentId: '2602203453',
                imagePath: 'lib/assets/images/foto-bernard.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
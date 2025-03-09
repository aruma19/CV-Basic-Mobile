import 'package:flutter/material.dart';
import 'package:tugas_latihankuis/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String nim;
  final String workExperience;
  final String organizationExperience;
  final String hardSkill;
  final String softSkill;
  final String achivement;

  const ProfilePage({
    super.key,
    required this.name,
    required this.nim,
    required this.workExperience,
    required this.organizationExperience,
    required this.hardSkill,
    required this.softSkill,
    required this.achivement,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profil Anda'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            shape: RoundedRectangleBorder(  
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profile.png'), 
                  ),
                  const SizedBox(height: 20),
                  _buildInfoCard(Icons.person, 'Nama', name),
                  _buildInfoCard(Icons.credit_card, 'NIM', nim),
                  _buildInfoCard(Icons.work, 'Pengalaman Kerja', workExperience),
                  _buildInfoCard(Icons.groups, 'Pengalaman Organisasi', organizationExperience),
                  _buildInfoCard(Icons.build, 'Hard Skill', hardSkill),
                  _buildInfoCard(Icons.lightbulb, 'Soft Skill', softSkill),
                  _buildInfoCard(Icons.star, 'Pencapaian', achivement),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Logout Berhasil'),
                          backgroundColor: Colors.black,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const Text('Logout', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}

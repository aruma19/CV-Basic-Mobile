import 'package:flutter/material.dart';
import 'package:tugas_latihankuis/profil_page.dart';
import 'package:tugas_latihankuis/save_button.dart'; // Import tombol custom

class HomePage extends StatefulWidget {
  final String username;
  final String? namaPanggilan;

  const HomePage({super.key, required this.username, this.namaPanggilan});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _workExperienceController = TextEditingController();
  final TextEditingController _organizationExperienceController = TextEditingController();
  final TextEditingController _hardSkillController = TextEditingController();
  final TextEditingController _softSkillController = TextEditingController();
  final TextEditingController _achivementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Halo, ${widget.namaPanggilan?.isNotEmpty == true ? widget.namaPanggilan : widget.username}!',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
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
                  mainAxisSize: MainAxisSize.min, // Agar ukuran sesuai kontennya
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Lengkapi Profil Anda",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(_nameController, 'Nama Lengkap'),
                    _buildTextField(_nimController, 'NIM'),
                    _buildTextField(_workExperienceController, 'Pengalaman Kerja'),
                    _buildTextField(_organizationExperienceController, 'Pengalaman Organisasi'),
                    _buildTextField(_hardSkillController, 'Hard Skill'),
                    _buildTextField(_softSkillController, 'Soft Skill'),
                    _buildTextField(_achivementController, 'Pencapaian/Penghargaan'),
                    const SizedBox(height: 20),
                    Center(
                      child: SaveButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProfilePage(
                                  name: _nameController.text,
                                  nim: _nimController.text,
                                  workExperience: _workExperienceController.text,
                                  organizationExperience: _organizationExperienceController.text,
                                  hardSkill: _hardSkillController.text,
                                  softSkill: _softSkillController.text,
                                  achivement: _achivementController.text,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

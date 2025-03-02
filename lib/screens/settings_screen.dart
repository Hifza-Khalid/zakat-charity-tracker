import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isNotificationsEnabled = true;
  String selectedLanguage = 'English';

  void _changeLanguage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("English"),
                onTap: () {
                  setState(() => selectedLanguage = "English");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Urdu"),
                onTap: () {
                  setState(() => selectedLanguage = "Urdu");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Arabic"),
                onTap: () {
                  setState(() => selectedLanguage = "Arabic");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[700]!, Colors.blueGrey[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Icon(Icons.settings, size: 80, color: Colors.white),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildSettingTile(
                    icon: Icons.dark_mode,
                    title: "Dark Mode",
                    trailing: Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() => isDarkMode = value);
                      },
                    ),
                  ),
                  _buildSettingTile(
                    icon: Icons.notifications,
                    title: "Notifications",
                    trailing: Switch(
                      value: isNotificationsEnabled,
                      onChanged: (value) {
                        setState(() => isNotificationsEnabled = value);
                      },
                    ),
                  ),
                  _buildSettingTile(
                    icon: Icons.language,
                    title: "Language",
                    trailing: TextButton(
                      onPressed: _changeLanguage,
                      child: Text(selectedLanguage, style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  _buildSettingTile(
                    icon: Icons.info,
                    title: "About App",
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: "Zakat & Charity App",
                        applicationVersion: "1.0.0",
                        applicationIcon: const Icon(Icons.favorite, color: Colors.red),
                        children: [
                          const Text("This app helps you manage Zakat, donations, and charity with ease."),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({required IconData icon, required String title, Widget? trailing, VoidCallback? onTap}) {
    return Card(
      color: Colors.blueGrey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}

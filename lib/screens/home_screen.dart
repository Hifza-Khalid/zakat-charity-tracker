import 'package:flutter/material.dart';
import 'zakat_calculator_screen.dart';
import 'donation_reminders_screen.dart';
import 'charity_list_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Zakat & Charity Tracker',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.green[700], // A deep green shade
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.green[300]!], // Light green gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.volunteer_activism, size: 80, color: Colors.green), // Charity Icon
            const SizedBox(height: 20),
            _buildMenuItem(context, '💰 Zakat Calculator', ZakatCalculatorScreen(), Colors.green[700]!),
            _buildMenuItem(context, '⏰ Donation Reminders', DonationRemindersScreen(), Colors.blue[700]!),
            _buildMenuItem(context, '📌 Charity List', CharityListScreen(), Colors.orange[700]!),
            _buildMenuItem(context, '⚙ Settings', SettingsScreen(), Colors.grey[700]!),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget screen, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity, // Makes the button full width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16), // Bigger touch area
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Smooth rounded edges
            ),
            elevation: 5,
          ),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

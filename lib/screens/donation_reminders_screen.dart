import 'package:flutter/material.dart';

class DonationRemindersScreen extends StatefulWidget {
  const DonationRemindersScreen({super.key});

  @override
  _DonationRemindersScreenState createState() => _DonationRemindersScreenState();
}

class _DonationRemindersScreenState extends State<DonationRemindersScreen> {
  final List<String> _reminders = [];

  void _addReminder() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController reminderController = TextEditingController();
        return AlertDialog(
          title: const Text("Set Donation Reminder"),
          content: TextField(
            controller: reminderController,
            decoration: const InputDecoration(
              hintText: "Enter donation purpose & date",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (reminderController.text.isNotEmpty) {
                  setState(() {
                    _reminders.add(reminderController.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Add Reminder"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donation Reminders',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.blue[300]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Icon(Icons.notifications_active, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              "Set and track your donation reminders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _reminders.isEmpty
                  ? const Center(
                child: Text(
                  "No donation reminders set!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )
                  : ListView.builder(
                itemCount: _reminders.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: const Icon(Icons.event, color: Colors.blue),
                      title: Text(_reminders[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _reminders.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addReminder,
        label: const Text("Add Reminder"),
        icon: const Icon(Icons.add_alert),
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}

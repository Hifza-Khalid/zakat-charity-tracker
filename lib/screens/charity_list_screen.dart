import 'package:flutter/material.dart';

class CharityListScreen extends StatefulWidget {
  const CharityListScreen({super.key});

  @override
  _CharityListScreenState createState() => _CharityListScreenState();
}

class _CharityListScreenState extends State<CharityListScreen> {
  final List<Map<String, String>> _charityList = [];

  void _addCharity() {
    TextEditingController nameController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Charity Donation"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Enter Charity Name"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Enter Amount Donated"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && amountController.text.isNotEmpty) {
                  setState(() {
                    _charityList.add({
                      "name": nameController.text,
                      "amount": "\$${amountController.text}",
                      "date": DateTime.now().toString().substring(0, 10),
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
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
          'Charity List',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.green[300]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Icon(Icons.volunteer_activism, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              "Track your charity donations easily",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _charityList.isEmpty
                  ? const Center(
                child: Text(
                  "No donations recorded yet!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )
                  : ListView.builder(
                itemCount: _charityList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.red),
                      title: Text(_charityList[index]["name"]!),
                      subtitle: Text("Amount: ${_charityList[index]["amount"]!} \nDate: ${_charityList[index]["date"]!}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _charityList.removeAt(index);
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
        onPressed: _addCharity,
        label: const Text("Add Donation"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}

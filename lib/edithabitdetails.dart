import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditHabitPage extends StatefulWidget {
  final String habitId; // Assuming you have a unique habit ID

  EditHabitPage({required this.habitId});

  @override
  _EditHabitPageState createState() => _EditHabitPageState();
}

class _EditHabitPageState extends State<EditHabitPage> {
  TextEditingController habitNameController = TextEditingController();
  String habitName = '';

  @override
  void initState() {
    super.initState();
    loadHabitData();
  }

  Future<void> loadHabitData() async {
    try {
      var habitSnapshot =
      await FirebaseFirestore.instance.collection('habits').doc(widget.habitId).get();
      var habitData = habitSnapshot.data();
      habitName = habitData?['name'] ?? '';
      habitNameController.text = habitName;
    } catch (e) {
      print('Error loading habit data: $e');
      // Handle error, e.g., show error dialog or message
    }
  }

  Future<void> updateHabit() async {
    try {
      await FirebaseFirestore.instance.collection('habits').doc(widget.habitId).update({
        'name': habitNameController.text,
        // Add more fields to update as needed
      });
      Navigator.pop(context); // Navigate back after update
    } catch (e) {
      print('Error updating habit: $e');
      // Handle error, e.g., show error dialog or message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: habitNameController,
              decoration: InputDecoration(labelText: 'Habit Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateHabit,
              child: Text('Update Habit'),
            ),
          ],
        ),
      ),
    );
  }
}

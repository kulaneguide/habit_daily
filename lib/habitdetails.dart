import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'edithabitdetails.dart';
 // Import your EditHabitPage

class HabitDetailsPage extends StatelessWidget {
  final String habitId; // Assuming you have a unique habit ID
  final String habitName;


  HabitDetailsPage({required this.habitId, required this.habitName});

  Future<void> deleteHabit(BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection('habits').doc(habitId).delete();
      Navigator.pop(context); // Navigate back after deletion
    } catch (e) {
      print('Error deleting habit: $e');
      // Handle error, e.g., show error dialog or message
    }
  }

  void navigateToUpdateHabit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditHabitPage(habitId: habitId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Habit Name: $habitName'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigateToUpdateHabit(context), // Navigate to edit page
              child: Text('Edit Habit'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => deleteHabit(context), // Call delete function
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Red color for delete button
              ),
              child: Text('Delete Habit'),
            ),
          ],
        ),
      ),
    );
  }
}

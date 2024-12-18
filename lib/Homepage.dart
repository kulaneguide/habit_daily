import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'addhabit.dart';
import 'habitdetails.dart';
// Import your HabitDetailsPage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('habits').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No habits found.'));
          }

          // Extract documents from snapshot
          var habits = snapshot.data!.docs;

          return ListView.builder(
            itemCount: habits.length,
            itemBuilder: (context, index) {
              var habitData = habits[index].data() as Map<String, dynamic>; // Cast to Map<String, dynamic>

              // Extract habit ID and name
              var habitId = habits[index].id;
              var habitName = habitData['name'];


              return ListTile(
                title: Text(habitName ?? 'No Name'), // Display habit name or fallback to 'No Name'
                subtitle: Text('Tap to view details'),
                onTap: () {
                  // Navigate to HabitDetailsPage and pass habitId and habitName
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HabitDetailsPage(habitId: habitId, habitName: habitName),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement logic to add a new habit
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHabitPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

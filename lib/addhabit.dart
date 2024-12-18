import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddHabitPage extends StatefulWidget {
  @override
  _AddHabitPageState createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _streakController = TextEditingController();

  void _addHabit() {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore.instance.collection('habits').add({
        'name': _nameController.text,
        'streak':  _streakController.text,
        'createdAt': Timestamp.now(),
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Habit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Habit Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a habit name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _streakController,
                decoration: InputDecoration(labelText: 'Time'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter time';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addHabit,
                child: Text('Add Habit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

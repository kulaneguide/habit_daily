import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Settings Page'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement action for settings option 1
              },
              child: Text('Settings Option 1'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement action for settings option 2
              },
              child: Text('Settings Option 2'),
            ),
          ],
        ),
      ),
    );
  }
}

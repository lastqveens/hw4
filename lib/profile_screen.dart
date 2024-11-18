import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homework4/main.dart';

class ProfileScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'Messaging App')),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null)
              Text("Logged in as: ${user.email}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (user != null) {
                  await user.updatePassword('newPassword123');  // Replace with actual logic for getting new password
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Password updated successfully'),
                  ));
                }
              },
              child: const Text("Change Password"),
            ),
          ],
        ),
      ),
    );
  }
}

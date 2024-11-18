import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Change Username'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Handle change username action
                _showChangeUsernameDialog(context);
              },
            ),
            ListTile(
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Handle change password action
                _showChangePasswordDialog(context);
              },
            ),
            ListTile(
              title: const Text('Date of Birth'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Handle change date of birth action
                _showChangeDobDialog(context);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle logout action
                _logout(context);
              },
              child: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red color for logout button
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChangeUsernameDialog(BuildContext context) {
    // Implementation for changing username
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController usernameController = TextEditingController();
        return AlertDialog(
          title: const Text('Change Username'),
          content: TextField(
            controller: usernameController,
            decoration: const InputDecoration(hintText: 'Enter new username'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Update username logic here
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    // Implementation for changing password
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController passwordController = TextEditingController();
        return AlertDialog(
          title: const Text('Change Password'),
          content: TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Enter new password'),
            obscureText: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Update password logic here
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showChangeDobDialog(BuildContext context) {
    // Implementation for changing date of birth
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController dobController = TextEditingController();
        return AlertDialog(
          title: const Text('Change Date of Birth'),
          content: TextField(
            controller: dobController,
            decoration: const InputDecoration(hintText: 'Enter your date of birth (YYYY-MM-DD)'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Update date of birth logic here
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) {
    // Logic for logging out the user
    // This could involve Firebase Auth sign-out or any other logic
    Navigator.of(context).pop(); // Example: close the settings page
    // Show a message or redirect to the login screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully')),
    );
  }
}
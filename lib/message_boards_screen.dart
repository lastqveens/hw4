import 'package:flutter/material.dart';
import 'package:homework4/chat_screen.dart';
import 'package:homework4/profile_screen.dart'; // Import your Profile Page
import 'package:homework4/settings_page.dart'; // Import your Settings Page

class MessageBoardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> boards = [
      {'title': 'Dating', 'id': 'dating_board_id'},
      {'title': 'Gaming', 'id': 'gaming_board_id'},
      {'title': 'Hookups', 'id': 'hookups_board_id'},
      {'title': 'Foodies', 'id': 'foodies_board_id'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Message Boards')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Message Boards'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Optionally navigate to the same screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: boards.map((board) {
          return ListTile(
            leading: const Icon(Icons.message),
            title: Text(board['title']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(boardId: board['id']!), // Pass the board ID
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
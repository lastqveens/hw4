import 'package:flutter/material.dart';
import 'package:homework4/chat_screen.dart';

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
      appBar: AppBar(title: Text('Message Boards')),
      body: ListView(
        children: boards.map((board) {
          return ListTile(
            leading: Icon(Icons.message),
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
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  final String boardId;

  const ChatScreen({super.key, required this.boardId});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .where('board_id', isEqualTo: boardId) // Filter by board_id
                  .orderBy('datetime')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      title: Text(message['username'] ?? 'Unknown User'),
                      subtitle: Text(message['content'] ?? ''),
                      trailing: Text(
                        message['datetime']?.toDate()?.toString() ?? '',
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(labelText: 'Send a message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    if (_messageController.text.isNotEmpty) {
                      await FirebaseFirestore.instance.collection('messages').add({
                        'board_id': boardId, // Use the passed board ID
                        'content': _messageController.text,
                        'username': 'YourDisplayName', // Replace with actual username
                        'datetime': FieldValue.serverTimestamp(),
                      });
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: ListView.builder(
        itemCount: 3, // Replace with the actual number of messages
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Text('abc'),
            ),
            title: Text('Message ${index + 1}'),
            subtitle: const Text('This is a demo message.'),
          );
        },
      ),
    );
  }
}

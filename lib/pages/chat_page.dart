import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/select_contact.dart';

import '../customUI/customcard.dart';
import '../model/chatmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.chats, required this.source})
      : super(key: key);
  final List<Chatmodel> chats;
  final Chatmodel source;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => ContactSelect(),
            ),
          );
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatmodel: widget.chats[index],
          source: widget.source,
        ),
      ),
    );
  }
}

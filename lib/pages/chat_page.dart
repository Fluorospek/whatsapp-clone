import 'package:flutter/material.dart';
import 'dart:math';
import 'package:whatsapp_clone/customUI/customcard.dart';
import 'package:whatsapp_clone/screens/select_contact.dart';

import '../model/chatmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chatmodel> chats = [
    Chatmodel(
      name: 'Rahul',
      isGroup: false,
      time: '4:00',
      currentMsg: "Hello World",
      icon: 'person.svg',
    ),
  ];

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
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatmodel: chats[index],
        ),
      ),
    );
  }
}

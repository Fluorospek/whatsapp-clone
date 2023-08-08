import 'package:flutter/material.dart';
import 'package:whatsapp_clone/customUI/contact_buttons.dart';
import 'package:whatsapp_clone/screens/homescreen.dart';

import '../model/chatmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Chatmodel? source;
  List<Chatmodel> chats = [
    Chatmodel(
      name: 'Rahul',
      isGroup: false,
      time: '4:00',
      currentMsg: "Hello World",
      icon: 'person.svg',
      id: 1,
    ),
    Chatmodel(
      name: 'Tanmay',
      isGroup: false,
      time: '5:00',
      currentMsg: "Bye World",
      icon: 'person.svg',
      id: 2,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            source = chats.removeAt(index);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (builder) =>
                        HomeScreen(chats: chats, source: source!)));
          },
          child: ContactButton(title: chats[index].name, icon: Icons.person),
        ),
      ),
    );
  }
}

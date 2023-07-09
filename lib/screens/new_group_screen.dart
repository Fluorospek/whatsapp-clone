import 'package:flutter/material.dart';
import '../customUI/contact_buttons.dart';
import '../model/chatmodel.dart';
import '../customUI/contact_card.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({Key? key}) : super(key: key);

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  List<Chatmodel> contacts = [
    Chatmodel(name: "Tanmay", status: "Flutter App Developer"),
    Chatmodel(name: "Tanmay", status: "Flutter App Developer"),
    Chatmodel(name: "Tanmay", status: "Flutter App Developer"),
    Chatmodel(name: "Tanmay", status: "Flutter App Developer"),
    Chatmodel(name: "Tanmay", status: "Flutter App Developer"),
    Chatmodel(name: "Tanmay", status: "Flutter App Developer"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          titleSpacing: 5,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, size: 24),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "....",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    value: "Invite a Friend",
                    child: Text("Invite a Friend"),
                  ),
                  PopupMenuItem(
                    value: "Contacts",
                    child: Text("Contacts"),
                  ),
                  PopupMenuItem(
                    value: "Refresh",
                    child: Text("Refresh"),
                  ),
                  PopupMenuItem(
                    value: "Help",
                    child: Text("Help"),
                  ),
                ];
              },
            ),
          ],
        ),
        // body: ListView(
        //       children: const [
        //         ContactButton(title: "New group", icon: Icons.group),
        //         ContactButton(title: "New contact", icon: Icons.person_add),
        //         ContactButton(title: "New Community", icon: Icons.group),
        //       ],
        //     ),
        body:ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ContactCard(chatmodel: contacts[index]);
          },
        ),
      ),
    );
  }
}
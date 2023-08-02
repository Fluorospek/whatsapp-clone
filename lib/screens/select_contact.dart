import 'package:flutter/material.dart';
import 'package:whatsapp_clone/customUI/contact_buttons.dart';
import 'package:whatsapp_clone/customUI/contact_card.dart';
import 'package:whatsapp_clone/model/chatmodel.dart';
import 'package:whatsapp_clone/screens/new_group_screen.dart';

class ContactSelect extends StatefulWidget {
  const ContactSelect({Key? key}) : super(key: key);

  @override
  State<ContactSelect> createState() => _ContactSelectState();
}

class _ContactSelectState extends State<ContactSelect> {
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
        body: ListView.builder(
          itemCount: contacts.length + 3,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const NewGroup(),
                      ),
                    );
                  },
                  child: const ContactButton(
                      title: "New group", icon: Icons.group));
            } else if (index == 1) {
              return const ContactButton(
                  title: "New contact", icon: Icons.person_add);
            } else if (index == 2) {
              return const ContactButton(
                  title: "New Community", icon: Icons.group);
            }
            return ContactCard(chatmodel: contacts[index - 3]);
          },
        ),
      ),
    );
  }
}

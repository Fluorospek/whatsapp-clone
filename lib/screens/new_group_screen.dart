import 'package:flutter/material.dart';
import 'package:whatsapp_clone/customUI/avatar_card.dart';

import '../customUI/contact_card.dart';
import '../model/chatmodel.dart';

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
  List<Chatmodel> groups = [];

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
                "New Group",
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add Participants",
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
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.isNotEmpty ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index - 1].selected == false) {
                      setState(() {
                        contacts[index - 1].selected = true;
                        groups.add(contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[index - 1].selected = false;
                        groups.remove(contacts[index - 1]);
                      });
                    }
                  },
                  child: ContactCard(
                    chatmodel: contacts[index - 1],
                  ),
                );
              },
            ),
            groups.isNotEmpty
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].selected == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    groups.remove(contacts[index]);
                                    contacts[index].selected = false;
                                  });
                                },
                                child: AvatarCard(
                                  contact: contacts[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

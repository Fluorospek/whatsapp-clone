import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/screens/idiv_page.dart';

import '../model/chatmodel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatmodel, required this.source})
      : super(key: key);
  final Chatmodel chatmodel;
  final Chatmodel source;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndivPage(
              chatmodel: chatmodel,
              source: source,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatmodel.isGroup! ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                height: 38,
                width: 37,
              ),
            ),
            trailing: Text(chatmodel.time!),
            subtitle: Row(
              children: [
                Icon(
                  Icons.done_all,
                  size: 20,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  chatmodel.currentMsg!,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            title: Text(
              chatmodel.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/model/chatmodel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.chatmodel}) : super(key: key);
  final Chatmodel chatmodel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.blueGrey[200],
          child: SvgPicture.asset(
            'assets/person.svg',
            color: Colors.white,
            height: 38,
            width: 37,
          ),
        ),
        title: Text(
          chatmodel.name,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        subtitle: Text(
          chatmodel.status!,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

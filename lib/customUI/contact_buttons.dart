import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }
}

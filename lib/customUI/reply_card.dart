import 'package:flutter/material.dart';

class ReplyBox extends StatelessWidget {
  const ReplyBox({super.key, required this.message,required this.time});
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: screenWidth - 30),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          //color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 60,
                  top: 5,
                  bottom: 25,
                ),
                child: Text(
                  "Hey",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  "20:48",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

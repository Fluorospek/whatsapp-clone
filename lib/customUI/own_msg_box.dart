import 'package:flutter/material.dart';

class OwnBox extends StatelessWidget {
  const OwnBox({super.key, required this.message, required this.time});
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: screenWidth - 30),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Color(0xffdcf8c6),
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
                  message,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

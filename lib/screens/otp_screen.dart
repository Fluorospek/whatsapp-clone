import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:whatsapp_clone/screens/login_screen.dart';

class OTPscreen extends StatefulWidget {
  const OTPscreen({super.key, required this.countryCode, required this.number});
  final String number;
  final String countryCode;
  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Verify ${widget.countryCode} ${widget.number}",
          style: TextStyle(
            color: Colors.teal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.03,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "We have sent an SMS with a code to ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: widget.countryCode + " " + widget.number,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: "    Wrong Number?",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            OtpTextField(
              numberOfFields: 4,
              onSubmit: (String verificationCode) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => LoginPage()),
                    (route) => false);
              },
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              "Enter 6 digit OTP",
              style: TextStyle(color: Colors.grey[600], fontSize: 15),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            bottomButton("Resend OTP", Icons.message),
            Container(
              width: screenWidth * 0.5,
              child: Divider(
                thickness: 1.5,
              ),
            ),
            bottomButton("Call", Icons.phone),
          ],
        ),
      ),
    );
  }

  Widget bottomButton(String text, IconData icon) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.teal,
          size: 30,
        ),
        SizedBox(
          width: screenWidth * 0.06,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.teal,
            fontSize: 17,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/login_page.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to WhatsApp",
                style: TextStyle(
                  fontSize: 29,
                  color: Colors.teal,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Image.asset(
                "assets/bg.png",
                color: Colors.greenAccent[700],
                height: 340,
                width: 340,
              ),
              SizedBox(
                height: screenHeight * 0.09,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Agree and Continue to accept the ",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextSpan(
                          text: "WhatsApp Terms of Service and Privacy Policy",
                          style: TextStyle(color: Colors.cyan)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                width: screenWidth - 110,
                height: screenHeight * 0.053,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[700],
                    textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => LoginPagePhone()),
                        (route) => false);
                  },
                  child: Text(
                    "Agree and Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

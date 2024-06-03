import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/country_model.dart';
import 'package:whatsapp_clone/pages/country_page.dart';
import 'package:whatsapp_clone/screens/otp_screen.dart';

class LoginPagePhone extends StatefulWidget {
  const LoginPagePhone({super.key});

  @override
  State<LoginPagePhone> createState() => _LoginPagePhoneState();
}

class _LoginPagePhoneState extends State<LoginPagePhone> {
  String countryName = "India";
  String countryCode = "+91";
  TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Enter Your Phone Number",
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              wordSpacing: 1,
            ),
          ),
          centerTitle: true,
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ],
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Text(
                "Whatsapp will send an SMS message to verify your number",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "What's my number",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.teal,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              countryCard(),
              SizedBox(
                height: 15,
              ),
              number(),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () {
                  if (_phoneNumber.text.length == 10) {
                    showNoDialogue();
                  }
                },
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget number() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.65,
      height: screenHeight * 0.05,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "+",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  countryCode.substring(1),
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.9),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.teal,
                    width: 1.8,
                  ),
                ),
              ),
              width: screenWidth * 0.55,
              child: TextFormField(
                controller: _phoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget countryCard() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => CountryPage(
              setCountryData: setCountryData,
            ),
          ),
        );
      },
      child: Container(
        width: screenWidth * 0.65,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.teal,
              width: 1.8,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    countryName,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            )
          ],
        ),
      ),
    );
  }

  void setCountryData(CountryModel country) {
    setState(() {
      countryName = country.name;
      countryCode = country.code;
    });
    Navigator.pop(context);
  }

  Future<void> showNoDialogue() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("We will be verifying you phone number"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(countryCode + " " + _phoneNumber.text),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Is this the correct number, or would you like to edit the number?")
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Edit")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => OTPscreen(
                          countryCode: countryCode,
                          number: _phoneNumber.text,
                        ),
                      ),
                    );
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }
}

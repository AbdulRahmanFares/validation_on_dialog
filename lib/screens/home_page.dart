import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validation_on_dialog/screens/validating_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
            "VALIDATION ON DIALOG",
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.04,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 2
            )
          ),
          centerTitle: true
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ValidatingDialog();
                }
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: screenHeight * 0.1,
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey
                )
              ),
              child: Text(
                "AlertBox",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1
                )
              )
            )
          )
        )
      )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValidatingDialog extends StatefulWidget {
  const ValidatingDialog({super.key});

  @override
  State<ValidatingDialog> createState() => _ValidatingDialogState();
}

class _ValidatingDialogState extends State<ValidatingDialog> {

  String name = "";
  String id = "";
  Color nameContainerColor = Colors.white; // Initial color for Name container
  Color idContainerColor = Colors.white; // Initial color for Id container

  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      content: SizedBox(
        height: screenHeight * 0.286,
        width: screenWidth * 0.683,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.03
            ),

            // Name
            Container(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05
              ),
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                color: nameContainerColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.07)
              ),
              child: TextFormField(
                maxLines: 1,
                cursorColor: nameContainerColor == Colors.white
                  ? Colors.grey
                  : Colors.white54,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15), // To vertically center the hint text inside the TextFormField 
                  border: InputBorder.none, // Remove the underline
                  hintText: "Name",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.04,
                    color: nameContainerColor == Colors.white
                      ? Colors.black54
                      : Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2
                  )
                ),

                // User input style
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.04,
                  color: nameContainerColor == Colors.white
                    ? Colors.black54
                    : Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                }
              )
            ),
            SizedBox(
              height: screenHeight * 0.03
            ),

            // Id
            Container(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05
              ),
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                color: idContainerColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.07)
              ),
              child: TextFormField(
                maxLines: 1,
                cursorColor: idContainerColor == Colors.white
                  ? Colors.grey
                  : Colors.white54,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15), // To vertically center the hint text inside the TextFormField 
                  border: InputBorder.none, // Remove the underline
                  hintText: "Id",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.04,
                    color: idContainerColor == Colors.white
                      ? Colors.black54
                      : Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2
                  )
                ),

                // User input style
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.04,
                  color: idContainerColor == Colors.white
                    ? Colors.black54
                    : Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2
                ),
                onChanged: (value) {
                  setState(() {
                    id = value;
                  });
                }
              )
            ),
            SizedBox(
              height: screenHeight * 0.03
            ),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // Cancel
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the dialog box
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: screenWidth * 0.01),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey
                        )
                      )
                    ),
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1
                      )
                    )
                  )
                ),

                // Ok button
                ElevatedButton(
                  onPressed: () {
                    if (name.isEmpty && id.isEmpty) {
                      // Set both container colors to red if both inputs are empty
                      setState(() {
                        nameContainerColor = Colors.red;
                        idContainerColor = Colors.red;
                      });
                    } else if (name.isEmpty) {
                      // Set Name container color to red if Name input is empty
                      setState(() {
                        nameContainerColor = Colors.red;
                        idContainerColor = Colors.white; // Reset Id container color
                      });
                    } else if (id.isEmpty) {
                      // Set Id container color to red, id Id input is empty
                      setState(() {
                        idContainerColor = Colors.red;
                        nameContainerColor = Colors.white; // Reset Name container color
                      });
                    } else {
                      // Do Something with the data
                      Navigator.of(context).pop(); // Close the dialog box
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: Size(screenWidth * 0.2, screenHeight * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.07)
                    )
                  ),
                  child: Text(
                    "Ok",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.035,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1
                    )
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}


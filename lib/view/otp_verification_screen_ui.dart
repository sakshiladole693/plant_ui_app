import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/view/plant_category_screen_ui.dart';

class OtpVerificationScreenUI extends StatelessWidget {
  const OtpVerificationScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                ),
                Spacer(),
                SvgPicture.asset("assets/svg/r2.svg"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Enter the OTP code from the phone we just sent you.",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textFieldContainer(),
                    textFieldContainer(),
                    textFieldContainer(),
                    textFieldContainer(),
                  ],
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: 'Don’t receive OTP code! ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      fontStyle: FontStyle.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return PlantCategoryScreenUI();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 124,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 40,
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromRGBO(62, 102, 24, 1),
                          Color.fromRGBO(124, 180, 70, 1),
                        ],
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  textFieldContainer() {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counter: SizedBox.shrink(), // removes counter completely
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromRGBO(204, 211, 196, 1),
              width: 1.0,
            ),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

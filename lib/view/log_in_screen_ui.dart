import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/view/otp_verification_screen_ui.dart';

class LogInScreenUI extends StatelessWidget {
  const LogInScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileNoController = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 248, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: SvgPicture.asset("assets/svg/r1.svg"),
            ),
            const SizedBox(height: 20),
            Text(
              "Log in",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: mobileNoController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counter: SizedBox.shrink(), // removes counter completely
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: SvgPicture.asset("assets/svg/call.svg"),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(204, 211, 196, 1),
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Mobile Number',
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(164, 164, 164, 1),
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (mobileNoController.text.length == 10) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return OtpVerificationScreenUI();
                      },
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Enter Valid Mobile Number",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 125,
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
                  "Log in",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Image.asset(
              height: 360,
              width: 360,
              "assets/images/p2.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

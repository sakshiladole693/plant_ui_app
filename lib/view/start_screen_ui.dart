import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/view/log_in_screen_ui.dart';

class StartScreenUI extends StatelessWidget {
  const StartScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            height: 464,
            width: double.infinity,
            "assets/images/p1.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),
          RichText(
            text: TextSpan(
              text: 'Enjoy your \nlife with ',
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 35,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Plants',
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return LogInScreenUI();
                  },
                ),
              );
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 85),
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
              child: RichText(
                text: TextSpan(
                  text: 'Get Started  ',
                  style: GoogleFonts.rubik(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  children: <WidgetSpan>[
                    WidgetSpan(
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

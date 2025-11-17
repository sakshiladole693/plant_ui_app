import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/view/plant_details_screen_ui.dart';

class PlantCategoryScreenUI extends StatefulWidget {
  const PlantCategoryScreenUI({super.key});

  @override
  State<PlantCategoryScreenUI> createState() => _PlantCategoryScreenUIState();
}

class _PlantCategoryScreenUIState extends State<PlantCategoryScreenUI> {
  int currentDiscountCardIndex = 0;
  List<PlantModel> items = PlantModel.discountCardImageList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: SvgPicture.asset("assets/svg/r3.svg"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Find your \nfavorite plants",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 40,
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      "assets/svg/shopping_cart.svg",
                      colorFilter: ColorFilter.mode(
                        Color.fromRGBO(62, 102, 24, 1),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          //CAROUSEL SLIDER
          CarouselSlider(
            items: List.generate(items.length, (index) => discountCard(index)),
            options: CarouselOptions(
              height: 130,
              viewportFraction: 0.85, //for width of that container
              initialPage: 0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  currentDiscountCardIndex = index;
                });
              },
            ),
          ),

          //dots indicator
          Center(
            child: DotsIndicator(
              dotsCount: items.length,
              position: currentDiscountCardIndex.toDouble(),
              decorator: DotsDecorator(
                color: Color.fromRGBO(197, 214, 181, 1),
                activeColor: Color.fromRGBO(62, 102, 24, 1),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              "Indoor",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 190,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PlantDetailsScreenUI();
                    },
                  ),
                );
              },
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return inDoorPlantCard();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SvgPicture.asset("assets/svg/line.svg"),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              "Outdoorr",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PlantDetailsScreenUI();
                    },
                  ),
                );
              },
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return outDoorPlantCard();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  discountCard(int discountCardIndex) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.only(left: 25, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(204, 231, 185, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: items[discountCardIndex].discount,
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: items[discountCardIndex].date,
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(items[discountCardIndex].imageLink),
        ],
      ),
    );
  }

  inDoorPlantCard() {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            color: Color.fromRGBO(0, 0, 0, 0.06),
            spreadRadius: 0,
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(height: 115, width: 90, "assets/images/p4.png"),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Snake Plants",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/svg/₹350.svg",
                colorFilter: ColorFilter.mode(
                  Color.fromRGBO(62, 102, 24, 1),
                  BlendMode.srcIn,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 238, 235, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    "assets/svg/shopping_cart.svg",
                    colorFilter: ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  outDoorPlantCard() {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            color: Color.fromRGBO(0, 0, 0, 0.06),
            spreadRadius: 0,
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(height: 115, width: 90, "assets/images/p4.png"),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Snake Plants",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

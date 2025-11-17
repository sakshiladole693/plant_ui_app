import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:plant_app/model/plant_details_model.dart';
import 'package:plant_app/model/plant_model.dart';

class PlantDetailsScreenUI extends StatefulWidget {
  const PlantDetailsScreenUI({super.key});

  @override
  State<PlantDetailsScreenUI> createState() => _PlantDetailsScreenUIState();
}

class _PlantDetailsScreenUIState extends State<PlantDetailsScreenUI> {
  int plantImageIndex = 1;
  List<PlantModel> items = PlantModel.discountCardImageList;

  static List<PlantDetailsModel> plantDetailsList = [
    PlantDetailsModel(
      feature: 'Height',
      info: '30cm-40cm',
      imageLink: 'assets/svg/height.svg',
    ),
    PlantDetailsModel(
      feature: 'Temperature',
      info: '20C-25C',
      imageLink: 'assets/svg/thermometer.svg',
    ),
    PlantDetailsModel(
      feature: 'Pot',
      info: 'Ciramic Pot',
      imageLink: 'assets/svg/pot.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 248, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(62, 102, 24, 1)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //CAROUSEL SLIDER
            CarouselSlider(
              items: List.generate(
                items.length,
                (plantImageIndex) => Image.asset(
                  items[plantImageIndex]
                      .imageLink, // ✅ use index, for connect initial page parameter of CarouselOptions
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              options: CarouselOptions(
                height: 300,
                initialPage: 1, // ✅ start from 2nd image (index 1)
                viewportFraction: 1, //for width of that container
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    plantImageIndex = index;
                  });
                },
              ),
            ),

            //dots indicator
            Center(
              child: DotsIndicator(
                dotsCount: items.length,
                position: plantImageIndex.toDouble(),
                decorator: DotsDecorator(
                  color: Color.fromRGBO(197, 214, 181, 1),
                  activeColor: Color.fromRGBO(62, 102, 24, 1),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "Snake Plansts",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Plansts make your life with minimal and \nhappy love the plants more and enjoy life.",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(118, 152, 75, 1),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      plantInfoCard(0),
                      plantInfoCard(1),
                      plantInfoCard(2),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Total Price\n',
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                            children: <WidgetSpan>[
                              WidgetSpan(
                                child: SvgPicture.asset('assets/svg/₹350.svg'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(103, 133, 74, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: SvgPicture.asset(
                                    'assets/svg/shopping_cart.svg',
                                    colorFilter: ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '   Add to cart',
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  plantInfoCard(int plantDetailIndex) {
    return Container(
      padding: const EdgeInsets.all(17.5),
      child: Column(
        children: [
          SizedBox(
            height: 35,
            child: SvgPicture.asset(
              plantDetailsList[plantDetailIndex].imageLink,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            plantDetailsList[plantDetailIndex].feature,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          Text(
            plantDetailsList[plantDetailIndex].info,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: Color.fromRGBO(255, 255, 255, 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

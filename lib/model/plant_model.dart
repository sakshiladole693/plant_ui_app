class PlantModel {
  String discount;
  String date;
  String imageLink;

  PlantModel({
    required this.discount,
    required this.date,
    required this.imageLink,
  });

  static List<PlantModel> discountCardImageList = [
    PlantModel(
      discount: '30% OFF\n',
      date: '02-23 April',
      imageLink: 'assets/images/p3.png',
    ),
    PlantModel(
      discount: '20% OFF\n',
      date: '02-23 May',
      imageLink: 'assets/images/p4.png',
    ),
    PlantModel(
      discount: '40% OFF\n',
      date: '05-23 June',
      imageLink: 'assets/images/p2.png',
    ),
  ];
}

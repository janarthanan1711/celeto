class CarouselModel{
  String? images;
   CarouselModel(this.images);
}

List carouselList = carouselImage.map((e) => CarouselModel(e['images'])).toList();

var carouselImage =[
  {"images":"assets/images/batman.jpg"},
  {"images":"assets/images/batman2.jpg"},
  {"images":"assets/images/batman3.jpg"},
];

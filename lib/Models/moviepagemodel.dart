class MoviePageModel {
  String? movieImages;
  String? movieNames;
  String? movieYear;

  MoviePageModel(this.movieImages,this.movieNames,this.movieYear);
}

List moviePageList = moviepageDatas.map((e)=>MoviePageModel(e['movieImages'], e['movieNames'], e['movieYear'])).toList();

var moviepageDatas = [
  {'movieNames' : 'Batman','movieImages':'assets/images/batman.jpg','movieYear' : '2005'},
  {'movieNames' : 'Avengers','movieImages':'assets/images/batman2.jpg','movieYear' : '2006'},
  {'movieNames' : 'Bigil','movieImages':'assets/images/batman3.jpg','movieYear' : '2019'},
  {'movieNames' : 'Mersal','movieImages':'assets/images/batman.jpg','movieYear' : '2017'},
  {'movieNames' : 'Viswasam','movieImages':'assets/images/batman2.jpg','movieYear' : '2022'},
  {'movieNames' : 'Iron Man','movieImages':'assets/images/batman3.jpg','movieYear' : '2005'},
  {'movieNames' : 'Annaatha','movieImages':'assets/images/batman.jpg','movieYear' : '2022'},
  {'movieNames' : 'Billa','movieImages':'assets/images/batman2.jpg','movieYear' : '2006'},
  {'movieNames' : 'Maari','movieImages':'assets/images/batman3.jpg','movieYear' : '2016'},
  {'movieNames' : 'Zero','movieImages':'assets/images/batman2.jpg','movieYear' : '2013'},
  {'movieNames' : 'Junga','movieImages':'assets/images/batman3.jpg','movieYear' : '2017'},
  {'movieNames' : 'Hero','movieImages':'assets/images/batman3.jpg','movieYear' : '2018'},
  {'movieNames' : 'Interstellar','movieImages':'assets/images/batman2.jpg','movieYear' : '2014'},
  {'movieNames' : 'King Kong','movieImages':'assets/images/batman3.jpg','movieYear' : '2002'},
  {'movieNames' : 'Zodiac','movieImages':'assets/images/batman3.jpg','movieYear' : '2006'},
  {'movieNames' : 'Superman','movieImages':'assets/images/batman2.jpg','movieYear' : '1998'},
  {'movieNames' : 'SpiderMan','movieImages':'assets/images/batman3.jpg','movieYear' : '2000'}
];

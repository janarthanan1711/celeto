class SeriesPageModel{
  String? seriesImages;
  String? seriesNames;
  String? seriesYear;

  SeriesPageModel(this.seriesImages,this.seriesNames,this.seriesYear);
}

List seriespageList = seriespageDatas.map((e)=>SeriesPageModel(e['seriesImages'], e['seriesNames'], e['seriesYear'])).toList();

var seriespageDatas = [
  {'seriesNames' : 'Batman','seriesImages':'assets/images/batman.jpg','seriesYear' : '2005'},
  {'seriesNames' : 'Avengers','seriesImages':'assets/images/batman2.jpg','seriesYear' : '2006'},
  {'seriesNames' : 'Bigil','seriesImages':'assets/images/batman3.jpg','seriesYear' : '2019'},
  {'seriesNames' : 'Mersal','seriesImages':'assets/images/batman.jpg','seriesYear' : '2017'},
  {'seriesNames' : 'Viswasam','seriesImages':'assets/images/batman2.jpg','seriesYear' : '2022'},
  {'seriesNames' : 'Iron Man','seriesImages':'assets/images/batman3.jpg','seriesYear' : '2005'},
  {'seriesNames' : 'Annaatha','seriesImages':'assets/images/batman.jpg','seriesYear' : '2022'},
  {'seriesNames' : 'Billa','seriesImages':'assets/images/batman2.jpg','seriesYear' : '2006'},
  {'seriesNames' : 'Maari','seriesImages':'assets/images/batman3.jpg','seriesYear' : '2016'},
  {'seriesNames' : 'Zero','seriesImages':'assets/images/batman2.jpg','seriesYear' : '2013'},
  {'seriesNames' : 'Junga','seriesImages':'assets/images/batman3.jpg','seriesYear' : '2017'},
  {'seriesNames' : 'Hero','seriesImages':'assets/images/batman3.jpg','seriesYear' : '2018'},
  {'seriesNames' : 'Interstellar','seriesImages':'assets/images/batman2.jpg','seriesYear' : '2014'},
  {'seriesNames' : 'King Kong','seriesImages':'assets/images/batman3.jpg','seriesYear' : '2002'},
  {'seriesNames' : 'Zodiac','seriesImages':'assets/images/batman3.jpg','seriesYear' : '2006'},
  {'seriesNames' : 'Superman','seriesImages':'assets/images/batman2.jpg','seriesYear' : '1998'},
  {'seriesNames' : 'SpiderMan','seriesImages':'assets/images/batman3.jpg','seriesYear' : '2000'}
];
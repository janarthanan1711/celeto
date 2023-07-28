class CategoryHome {
  String? categoryTitle;
  String? categoryImages;

  CategoryHome(this.categoryTitle,this.categoryImages);
}

List categoryHomeList = categoryHomeDatas.map((e) => CategoryHome(e['categoryTitle'], e['categoryImages'])).toList();

var categoryHomeDatas = [
  {'categoryTitle' : 'Trending Near You','categoryImages':'assets/images/batman.jpg'},
  {'categoryTitle' : 'Latest Movies','categoryImages':'assets/images/batman2.jpg'},
  {'categoryTitle' : 'Latest Series','categoryImages':'assets/images/batman3.jpg'},
  {'categoryTitle' : 'Hit Series','categoryImages':'assets/images/batman.jpg'},
  {'categoryTitle' : 'Marvel Movies','categoryImages':'assets/images/batman2.jpg'},
  {'categoryTitle' : 'DC Movies','categoryImages':'assets/images/batman3.jpg'},
  {'categoryTitle' : 'Top Hollywood Movies','categoryImages':'assets/images/batman.jpg'},
  {'categoryTitle' : 'Top Kollywood Movies','categoryImages':'assets/images/batman2.jpg'},
  {'categoryTitle' : 'Top Bollywood Movies','categoryImages':'assets/images/batman3.jpg'},
  {'categoryTitle' : 'Cartoons','categoryImages':'assets/images/batman2.jpg'},
  {'categoryTitle' : 'Ultimate Entertainer','categoryImages':'assets/images/batman3.jpg'}
];

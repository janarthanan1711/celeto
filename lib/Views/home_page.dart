import 'package:carousel_slider/carousel_slider.dart';
import 'package:celeto/Models/actioncategory.dart';
import 'package:celeto/Models/carouselmodel.dart';
import 'package:celeto/Models/categoryhome.dart';
import 'package:celeto/Models/tabbarmodel.dart';
import 'package:celeto/Views/favorites.dart';
import 'package:flutter/material.dart';
import '../Resources/mytheme.dart';
import 'bodyViews/body_homepage.dart';
import 'bodyViews/search_box_page.dart';
import 'movies_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  int _activeIndex = 0;
  late TabController _tabController;
  List TabIcons=[

    const Text('🤗',style: TextStyle(fontSize: 30),),
    const Text('😡',style: TextStyle(fontSize: 30),),
    const Text('🤣',style: TextStyle(fontSize: 30),),
    const Text('❤️',style: TextStyle(fontSize: 30),),
    const Text('😎',style: TextStyle(fontSize: 30),),
    const Text('🫣',style: TextStyle(fontSize: 30),),

  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabBarLists.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabBarLists.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){},
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/clogo.jpg'),
                    ),
                  ),
                ),
                expandedHeight: 400.0,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(carouselList.length, (index) => Container(
                 height: 8,
            width: 8,
             margin: const EdgeInsets.only(left: 5,right: 5),
             decoration: BoxDecoration(
               color: index == _activeIndex ? const Color(0xFFCD7F32) : Colors.white,
            shape: BoxShape.circle
            ),
            ),
            ),
            ),

                    background: CarouselSlider.builder(itemCount: carouselList.length, itemBuilder: (BuildContext context,int index,int pageIndex) {
                        return Image(image: AssetImage(carouselList[index].images,),
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,);
                    },

                        options: CarouselOptions(
                      autoPlay: true,
                      height: 400,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            onPageChanged: (activeIndex, reason) {
                              setState(() {
                                _activeIndex = activeIndex;

                              });
                            }
                    )),
                ),
                actions: [
                  IconButton(
                    iconSize: 40,
                      onPressed: (){
                        showSearch(
                            context: context,
                            // delegate to customize the search bar
                            delegate: CustomSearchDelegate()
                        );
                      }, icon: const Icon(Icons.search)),
                  IconButton(
                      iconSize: 40,
                      onPressed: (){
                        // setState(() {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) =>  const ProfilePage()),
                        //   );
                        // });
                      }, icon: const Icon(Icons.account_circle_rounded,color: Color(0xFFCD7F32),))
                ],
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                   TabBar(
                     controller: _tabController,
                     isScrollable: true,
                       unselectedLabelColor: const Color(0xFF2E4053),
                       indicator: ShapeDecoration(
                         color: Mytheme.isDark == true ? Color(0xFF2E4053) : Color(0xFFCD7F32),
                           // color: const Color(0xFF092123),
                           shape: BeveledRectangleBorder(
                               borderRadius: BorderRadius.circular(20),
                               side: const BorderSide(
                                 color: Color(0xFFCD7F32),
                               ))
                       ),

                    tabs: List.generate(
                        tabBarLists.length, (index) {
                      return Tab(
                        text: tabBarLists[index].values,
                        icon: TabIcons[index],
                      );
                    })
                  ),
                ),
                pinned: true,
              ),
            ];
          },

          body:TabBarView(
            controller: _tabController,
            children: [
            SizedBox(
              height: double.maxFinite,
              child: ListView.builder(
                itemCount: categoryHomeList.length,
                  itemBuilder: (BuildContext context,int index){
                  return  Column(
                    children: [
                      BodyHome(
                        width: 140,
                        height: 200,
                        categoryNames: categoryHomeList[index].categoryTitle,
                        moreButton: (){
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>   MoviesPage(showIcon: true,)),
                          );
                        });
                        },
                      ),
                    ],
                  );
              })
            ),
              SizedBox(
                height: 580,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, //
                      // spacing between columns
                    ),
                    itemCount: actionCategoryList.length,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        children: [
                          const SizedBox(height: 11,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: 200,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                                  image: DecorationImage(image: AssetImage(actionCategoryList[index].movieImages),fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(actionCategoryList[index].movieNames,style:  TextStyle(color:Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),
                                Text(actionCategoryList[index].movieYear,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),

                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 580,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, //
                      // spacing between columns
                    ),
                    itemCount: comedyCategoryList.length,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        children: [
                          const SizedBox(height: 11,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: 200,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                                  image: DecorationImage(image: AssetImage(comedyCategoryList[index].movieImages),fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(comedyCategoryList[index].movieNames,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),
                                Text(comedyCategoryList[index].movieYear,style:  TextStyle(color:Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),

                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 580,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, //
                      // spacing between columns
                    ),
                    itemCount: loveCategoryList.length,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        children: [
                          const SizedBox(height: 11,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: 200,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                                  image: DecorationImage(image: AssetImage(loveCategoryList[index].movieImages),fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(loveCategoryList[index].movieNames,style:  TextStyle(color:Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),
                                Text(loveCategoryList[index].movieYear,style:  TextStyle(color:Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),

                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 580,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, //
                      // spacing between columns
                    ),
                    itemCount: fantasyCategoryList.length,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        children: [
                          const SizedBox(height: 11,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: 200,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                                  image: DecorationImage(image: AssetImage(fantasyCategoryList[index].movieImages),fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(fantasyCategoryList[index].movieNames,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),
                                Text(fantasyCategoryList[index].movieYear,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),

                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 580,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, //
                      // spacing between columns
                    ),
                    itemCount: horrorCategoryList.length,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        children: [
                          const SizedBox(height: 11,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: 200,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                                  image: DecorationImage(image: AssetImage(horrorCategoryList[index].movieImages),fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(horrorCategoryList[index].movieNames,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),
                                Text(horrorCategoryList[index].movieYear,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),

                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
          ],

          )
        ),
      );

  }



}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  Container(
      color: Mytheme.isDark == true ? Color(0xFFCD7F32) : Color(0xFFEAEAEA),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

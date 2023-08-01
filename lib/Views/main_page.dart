import 'package:celeto/Resources/mytheme.dart';

import 'home_page.dart';
import 'series_page.dart';
import 'package:flutter/material.dart';
import 'favorites.dart';
import 'movies_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int activePage = 0;

  final totalPages = [
    const HomePage(),
    MoviesPage(showIcon: false),
    SeriesPage(showIcon: false),
    const ProfilePage(),
  ];

  void onItemTapped(selectedPage){
    setState(() {
      activePage = selectedPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    Future<bool> ShowLogoutDialog() async{
      return await showDialog(context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return AlertDialog(
              backgroundColor:  Mytheme.isDark == true ? Colors.white : Colors.black,
              titlePadding: EdgeInsets.symmetric(horizontal: 100,vertical: 10),
              title: CircleAvatar(
                radius: 35,
                backgroundImage: Mytheme.isDark == true ? AssetImage('assets/images/logout_orange.jpg') : AssetImage('assets/images/logout_blue.jpg'),
              ),
              content:  SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Are you sure want to Logout?',style: TextStyle(fontSize: 20,color: Mytheme.isDark == true ? Colors.black : Colors.white),),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child:  Text('No',style: TextStyle(fontSize: 20,color: Mytheme.isDark == true ? Colors.deepOrange : Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child:  Text('Yes',style: TextStyle(fontSize: 20,color: Mytheme.isDark == true ? Colors.deepOrange : Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          }

      )??false;
    }
    return WillPopScope(
      onWillPop: ShowLogoutDialog,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA),
          body: totalPages[activePage],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFF2E4053),
            type: BottomNavigationBarType.shifting,
            iconSize: 35,
            // elevation: 16.0,
            selectedFontSize: 20,
            showUnselectedLabels: true,
            selectedIconTheme: const IconThemeData(color: Color(0xFFCD7F32), size: 40),
            selectedItemColor: const Color(0xFFCD7F32),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedIconTheme: const IconThemeData(color: Color(0xFFCD7F32), size: 40),
            unselectedItemColor: Colors.white,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
            currentIndex: activePage,
            onTap: onItemTapped,
            items: const [
              BottomNavigationBarItem(
                backgroundColor:  Color(0xFF2E4053),
                  icon: Icon(Icons.home_filled),label: 'Home'),
              BottomNavigationBarItem(
                  backgroundColor:  Color(0xFF2E4053),
                  icon: Icon(Icons.local_movies),label: 'Movies'),
              BottomNavigationBarItem(
                  backgroundColor:  Color(0xFF2E4053),
                  icon: Icon(Icons.move_to_inbox),label: 'Series'),
              BottomNavigationBarItem(
                  backgroundColor:  Color(0xFF2E4053),
                  icon: Icon(Icons.account_box_rounded,),label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }


}

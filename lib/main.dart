import 'package:celeto/Resources/config.dart';
import 'package:celeto/Resources/mytheme.dart';
import 'package:celeto/Views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'Views/home_page.dart';
import 'Views/signupViews/splash_screen.dart';


void main() async{
  await Hive.init;
  box = await Hive.openBox('easyTheme');
  runApp(const MyApp());
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // currentTheme.addListener(() {
    //   setState(() {
    //
    //   });
    // });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Mytheme(),
      child: Consumer<Mytheme>(builder: (context,state,child){
         return MaterialApp(
        title: 'Celeto',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
          theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: currentTheme.currentTheme(),
        home:  SplashScreen()
      );
      })
    );
  }
}




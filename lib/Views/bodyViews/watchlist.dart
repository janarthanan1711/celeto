import 'package:celeto/Resources/config.dart';
import 'package:flutter/material.dart';

import '../../Resources/mytheme.dart';
import '../movie_details_page.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
          child: Icon(Icons.arrow_back)),),
      backgroundColor: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA),
      body: Container(
        width: double.infinity,
        height: 800,
        color: Colors.yellow,
        child: ListView.builder(
            itemCount: commonUtils.cardDatas!.length,
            itemBuilder: (BuildContext context,int index){
              return commonUtils.cardDatas![index];

        }),
      ),

    );
  }
}

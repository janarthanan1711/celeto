import 'package:flutter/material.dart';

import '../../Resources/config.dart';
import '../../Resources/mytheme.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Downloads',style: TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 25,fontWeight: FontWeight.bold),),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),),
      body: SizedBox(
        width: double.infinity,
        height: 800,
        child: ListView.builder(
            itemCount: commonUtils.cardDatas!.length,
            itemBuilder: (BuildContext context,int index){
              return commonUtils.cardDatas![index];
            }),
      ),

    );
  }
}

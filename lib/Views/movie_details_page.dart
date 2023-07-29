import 'package:celeto/Resources/commonDatas.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import '../Models/categoryhome.dart';
import '../Resources/config.dart';
import '../Resources/mytheme.dart';
import 'bodyViews/body_homepage.dart';
import 'category_page/cardwidget.dart';
class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage ({super.key, required this.values});

  final int values;
  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {

   cardListDatas(){
    setState(() {
       commonUtils.cardDatas?.add(const CommonCardWidget());
    });
  }
  late FlickManager flickManager;
  String videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(videoUrl),
    );
  }


  bool changed = false;

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Mytheme.isDark == true ? const Color(0xFFCD7F32) : const Color(0xFF2E4053),),
          onPressed: (){
          Navigator.pop(context);
        },
        ),
        title: Text('Movie Name',style: TextStyle(color: Mytheme.isDark == true ? const Color(0xFFCD7F32) : const Color(0xFF2E4053))),
        centerTitle: true,
        backgroundColor: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFCD7F32),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: FlickVideoPlayer(
                  flickManager: flickManager
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text('Movie Name',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),

                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Text('Movie - ',style: TextStyle(fontSize: 13,color: Mytheme.isDark == true ? Colors.white38 : Colors.black,fontWeight: FontWeight.bold)),
                        Text('22-Apr-2023 - ',style: TextStyle(fontSize: 12,color: Mytheme.isDark == true ? Colors.white38 : Colors.black,fontWeight: FontWeight.bold)),
                        Text('2h 5m 22s - ',style: TextStyle(fontSize: 12,color: Mytheme.isDark == true ? Colors.white38 : Colors.black,fontWeight: FontWeight.bold),),
                        Text('Action - ',style: TextStyle(fontSize: 12,color: Mytheme.isDark == true ? Colors.white38 : Colors.black,fontWeight: FontWeight.bold),),
                        Text('U/A 13+',style: TextStyle(fontSize: 12,color: Mytheme.isDark == true ? Colors.white38 : Colors.black,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: screenWidth,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Icon(Icons.share,
                                  color: Mytheme.isDark == true ?  Colors.white : Colors.black,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Share',style: TextStyle(fontSize: 12,color: Mytheme.isDark == true ?  Colors.white : Colors.black),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: cardListDatas,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Icon(Icons.add_road,
                                  color: Mytheme.isDark == true ?  Colors.white : Colors.black,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'WatchList',style: TextStyle(fontSize: 12,color: Mytheme.isDark == true ?  Colors.white : Colors.black),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: cardListDatas,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.download_rounded,
                                  color: Mytheme.isDark == true ?  Colors.white : Colors.black,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Download',style: TextStyle(fontSize: 12,color: Mytheme.isDark == true ?  Colors.white : Colors.black),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.play_circle,
                                  color: Mytheme.isDark == true ?  Colors.white : Colors.black,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Watch Trailer',style: TextStyle(fontSize: 12,color: Mytheme.isDark == true ?  Colors.white : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(height: 10,),
              Card(
                color:Mytheme.isDark == true ? const Color(0xFFaecfd4) : const Color(0xFFedb580),
                child: ExpansionTile(
                  iconColor: Mytheme.isDark == true ?  Colors.white : Colors.black,
                  collapsedIconColor: Mytheme.isDark == true ?  Colors.white : Colors.black,
                  onExpansionChanged: (
                      value
                      ){
                    setState(() {
                      changed = value;
                    });
                  },
                  textColor: Mytheme.isDark == true ?  Colors.white : Colors.black,
                  title: changed == false ?  Text("iron Man is a 2008 American superhero film ",style: TextStyle(color: Mytheme.isDark == true ?  Colors.white : Colors.black),) :  Text('Movie Name',style: TextStyle(color: Mytheme.isDark == true ?  Colors.white : Colors.black)),
                  children: [
                    Text("Iron Man is a 2008 American superhero film based on the Marvel Comics character of the same name. Produced by Marvel Studios and distributed by Paramount Pictures, it is the first film in the Marvel Cinematic Universe (MCU).",style: TextStyle(color: Mytheme.isDark == true ?  Colors.white : Colors.black),),
                  ],
                ),
              ),
                    const SizedBox(height: 10,),
                    SizedBox(
                        height: 600,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context,int index){
                              return  Column(
                                children: [
                                  BodyHome(
                                    width: 140,
                                    height: 60,
                                    categoryNames: categoryHomeList[index].categoryTitle,

                                  ),
                                ],
                              );
                            })
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:celeto/Models/moviepagemodel.dart';
import 'package:flutter/material.dart';

import '../Resources/mytheme.dart';
class MoviesPage extends StatefulWidget {
   MoviesPage({super.key, required this.showIcon});
  bool? showIcon;

  @override
  State<MoviesPage> createState() => _MoviesPageState();

}

class _MoviesPageState extends State<MoviesPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
     Scaffold(
       backgroundColor: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA),
       body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children:  [
                  widget.showIcon == true ?  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 25,)),
                      ) : const SizedBox(),
                       Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Movies',style: TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 25,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
               SizedBox(
                      height: 820,
                      child: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(  maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                          itemCount: moviePageList.length,
                          itemBuilder: (BuildContext ctx, index) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: 200,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                                  image: DecorationImage(image: AssetImage(moviePageList[index].movieImages),fit: BoxFit.fill)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(moviePageList[index].movieNames,style: TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text(moviePageList[index].movieYear,style: TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 18,fontWeight: FontWeight.bold),),

                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    ),

                ],

              ),
            ),
          ),
     ),

    );
  }
}

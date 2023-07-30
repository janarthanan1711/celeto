import 'package:flutter/material.dart';

import '../../Models/moviepagemodel.dart';
import '../../Resources/mytheme.dart';
class CategoryPageGrid extends StatefulWidget {
  const CategoryPageGrid ({super.key, required this.clickImage,required this.movieName,required this.movieYear,required this.images});

  final void Function() clickImage;
  final String? images;
  final String? movieName;
  final String? movieYear;

  @override
  State<CategoryPageGrid> createState() => _CategoryPageGridState();
}

class _CategoryPageGridState extends State<CategoryPageGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: 600,
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 580,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, //
                // spacing between columns
              ),
                  itemCount: moviePageList.length,
                  itemBuilder: (BuildContext context, int index){
                 return Column(
                  children: [
                    InkWell(
                      onTap: widget.clickImage,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: 200,
                        height: 85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                            image: DecorationImage(image: AssetImage(widget.images!),fit: BoxFit.fill)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.movieName!,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),
                          Text(widget.movieYear!,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

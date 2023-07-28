import 'package:celeto/Models/carouselmodel.dart';
import 'package:celeto/Models/categoryhome.dart';
import 'package:celeto/Resources/mytheme.dart';
import 'package:celeto/Views/movies_page.dart';
import 'package:flutter/material.dart';

import '../movie_details_page.dart';
class BodyHome extends StatefulWidget {
  const BodyHome ({super.key,this.categoryNames,this.moreButton,this.imageFunction, required this.width, required this.height});



  @override
  State<BodyHome> createState() => _BodyHomeState();
  final String? categoryNames;
  final void Function()? moreButton;
  final Function(int index)? imageFunction;
  final double width;
  final double height;
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(widget.categoryNames!,style:  TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 20,fontWeight: FontWeight.bold),),
             TextButton(onPressed: widget.moreButton, child:  Text('More',style: TextStyle(color:  Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),),))
           ],
          ),
        ),
        const SizedBox(height:  5,),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryHomeList.length,
                    itemBuilder: (BuildContext context,int index)   {
                  return InkWell(
                    // onTap: widget.imageFunction!(index),
                    onTap: (){
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  MovieDetailsPage(values: index,)),
                        );
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: widget.width,
                      height: widget.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                        image: DecorationImage(image: AssetImage(categoryHomeList[index].categoryImages),fit: BoxFit.fill)
                      ),
                    ),
                  );
    }        ),
              ),
            )
      ],
    ),
      ],
    );
  }


}

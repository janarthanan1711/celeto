import 'package:celeto/Models/moviepagemodel.dart';
import 'package:flutter/material.dart';

import '../../Resources/config.dart';
import '../../Resources/mytheme.dart';
class CommonCardWidget extends StatefulWidget {
  const CommonCardWidget({super.key, this.removeWidget});

  final void Function()? removeWidget;

  @override
  State<CommonCardWidget> createState() => _CommonCardWidgetState();
}

class _CommonCardWidgetState extends State<CommonCardWidget> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 320,
      child: Card(
        color: Mytheme.isDark == true ? const Color(0xFFaecfd4) : const Color(0xFFedb580),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(1, (index) {
               return Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       width: 110,
                       height: 120,
                       decoration: BoxDecoration(
                         border: Border.all(color: const Color(0xFF02426f),width: 2.0),
                         borderRadius: BorderRadius.circular(10),
                         image: DecorationImage(image: AssetImage(moviePageList[index].movieImages),fit: BoxFit.fill)
                       ),
                     ),
                     Column(
                       children: [
                         Text(moviePageList[index].movieNames,style: TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 25,fontWeight: FontWeight.bold),),
                         SizedBox(height: 10,),
                         Text(moviePageList[index].movieYear,style: TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 25,fontWeight: FontWeight.bold),),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             TextButton(onPressed: widget.removeWidget, child: Icon(Icons.delete)),
                             TextButton(onPressed: (){}, child: Icon(Icons.delete)),
                             TextButton(onPressed: (){}, child: Icon(Icons.delete))

                           ],
                         )

                       ],
                     )
                   ],
                 ),
               );
            })


          )

      ),
    );
  }
}

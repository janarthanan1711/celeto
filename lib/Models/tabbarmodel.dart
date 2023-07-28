import 'package:flutter/material.dart';

class TabBarModelClass {
   String? values;

   TabBarModelClass(this.values);

}

List tabBarLists = tabBarDatas.map((e) => TabBarModelClass(e['values'])).toList();

var tabBarDatas =[
  {'values':'   All    '},
  {'values':'  Action  '},
  {'values':'  Comedy  '},
  {'values':'   Love   '},
  {'values':'  Fantasy '},
  {'values':'  Horror  '},
];
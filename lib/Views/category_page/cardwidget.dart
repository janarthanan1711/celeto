import 'package:flutter/material.dart';

import '../../Resources/mytheme.dart';
class CommonCardWidget extends StatefulWidget {
  const CommonCardWidget({super.key});

  @override
  State<CommonCardWidget> createState() => _CommonCardWidgetState();
}

class _CommonCardWidgetState extends State<CommonCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Mytheme.isDark == true ? const Color(0xFFaecfd4) : const Color(0xFFedb580),
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        width: 320,
        height: 130,
        child: ListTile(
          leading: Image.asset('assets/images/batman.jpg',height: 120,),
          title: const Text('Demo Title'),
          subtitle: const Text('This is a simple card in Flutter.'),
        ),
      ),
    );
  }
}

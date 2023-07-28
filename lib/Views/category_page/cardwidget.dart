import 'package:flutter/material.dart';
class CommonCardWidget extends StatefulWidget {
  const CommonCardWidget({super.key});

  @override
  State<CommonCardWidget> createState() => _CommonCardWidgetState();
}

class _CommonCardWidgetState extends State<CommonCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        width: 250,
        height: 100,
        child: ListTile(
          leading: Image.asset('assets/images/batman.jpg'),
          title: const Text('Demo Title'),
          subtitle: const Text('This is a simple card in Flutter.'),
        ),
      ),
    );
  }
}

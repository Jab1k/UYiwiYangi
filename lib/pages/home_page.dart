import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatefulWidget {
  String Name;
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/f/fc/Thunder_lightning_Garajau_Madeira_289985700.jpg'))),
        child: Column(
          children: [
            Center(
                child: Text(
              '${}',
              style: TextStyle(fontSize: 50),
            ))
          ],
        ),
      ),
    ));
  }
}

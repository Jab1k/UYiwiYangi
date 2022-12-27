// ignore: duplicate_ignore
// ignore_for_file: unnecessary_import, implementation_imports, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_8/pages/home_page.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController countries = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/f/fc/Thunder_lightning_Garajau_Madeira_289985700.jpg'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: countries,
                  style: const TextStyle(color: Colors.white),
                  textCapitalization: TextCapitalization.sentences,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      hintText: ' Search for a city or airport',
                      hintStyle: const TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.only(left: 30),
                      // ignore: prefer_const_constructors
                      suffixIcon: Icon(
                        Icons.search_sharp,
                        color: Colors.white,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 111, 108, 156))),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 111, 108, 156)))),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: ((context) =>
                              WeathersHome(name: countries.text))),
                      (route) => false);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Color.fromARGB(255, 91, 171, 26))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gradient: LinearGradient(colors: [
                        Color(0xff48319D),
                        Color(0xff1F1D47),
                        Color(0xff083072),
                      ])),
                  child: const Center(
                      child: Text(
                    'Find',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

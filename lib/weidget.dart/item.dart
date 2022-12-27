import 'package:flutter/material.dart';

class HourItem extends StatelessWidget {
  final bool isActive;
  final String? title;
  final String? image;
  final num? temp;

  const HourItem(
      {Key? key,
      required this.isActive,
      required this.title,
      required this.temp,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: EdgeInsets.only(right: 24),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color:
              isActive ? Color(0xff48319D) : Colors.pinkAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            (title ?? "").substring((title ?? "").indexOf(" ") + 1),
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Image.network("https:${image ?? ""}"),
          Text(
            (temp ?? 0)
                .toString()
                .substring(0, (temp ?? 0).toString().indexOf(".")),
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

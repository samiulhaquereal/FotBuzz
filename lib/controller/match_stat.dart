import 'package:flutter/material.dart';

Widget teamStat(String team, String logoUrl, String teamName) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       /* Text(
          team,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),*/
        SizedBox(
          height: 10.0,
        ),
        Image.network(
          logoUrl,
          width: 30,
          height: 40,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ],
    ),
  );
}
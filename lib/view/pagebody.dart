import 'package:flutter/material.dart';
import 'package:fotbuzz/controller/goal_stat.dart';
import 'package:fotbuzz/controller/match_stat.dart';
import 'package:fotbuzz/controller/match_tile.dart';
import 'package:fotbuzz/model/soccer_match.dart';

Widget PageBody(List<SoccerMatch> allmatches) {

  var elapsed = allmatches[0].fixture.status.elapsedTime;
  if (elapsed == null) elapsed = 0;
  if (allmatches.isEmpty) {
    return Center(
      child: Text(
        'No matches available',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  return Column(
    children: [
      Expanded(
        flex: 3,
        child: Card(
          margin: EdgeInsets.all(20),
          color: Color(0xFF1e1e1e),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('League Name',style: TextStyle(color: Colors.white),),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Text("${elapsed}'",style: TextStyle(color: Colors.green),))
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    teamStat("Home", allmatches[0].home.logoUrl,
                        allmatches[0].home.name),
                    goalStat(allmatches[0].fixture.status.elapsedTime,
                        allmatches[0].goal.home, allmatches[0].goal.away),
                    teamStat("Away", allmatches[0].away.logoUrl,
                        allmatches[0].away.name),
                  ],
              ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {},
                    child: Text('Details'),
                    ),
                  )
                ),
              ]
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFFF710D),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Score",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allmatches.length,
                    itemBuilder: (context, index) {
                      return matchTile(allmatches[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
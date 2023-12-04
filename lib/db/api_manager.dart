import 'dart:convert';

import 'package:fotbuzz/model/soccer_match.dart';
import 'package:http/http.dart';

class SoccerApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "41bd1541e4dc8075da8ecf273101cc96"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    try {
      Response res = await get(Uri.parse(apiUrl), headers: headers);

      if (res.statusCode == 200) {
        // this means that we are connected to the database
        var body = jsonDecode(res.body);

        if (body != null && body is Map<String, dynamic> && body['response'] != null) {
          List<dynamic> matchesList = body['response'];

          print("Api service: ${matchesList}"); // to debug

          List<SoccerMatch> matches = matchesList
              .map((dynamic item) => SoccerMatch.fromJson(item))
              .whereType<SoccerMatch>() // Filter out null matches
              .toList();

          return matches;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load data: ${res.statusCode}');
      }
    } catch (e) {
      print('Error in getAllMatches: $e');
      throw Exception('Failed to load data');
    }
  }
}

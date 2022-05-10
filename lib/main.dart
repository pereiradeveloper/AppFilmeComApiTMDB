import 'package:app_filme_api/utils/text.dart';
import 'package:app_filme_api/widgets/toprated.dart';
import 'package:app_filme_api/widgets/trending.dart';
import 'package:app_filme_api/widgets/tv.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = "78cc70885226757ad48b1be586c25735";
  final readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3OGNjNzA4ODUyMjY3NTdhZDQ4YjFiZTU4NmMyNTczNSIsInN1YiI6IjYyNzdiOGNmYTgwMjM2MTQxNDVlMmM1OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4NznLJK6gqkldpCezJq0pls114sZWXuL3f1qCiYT3bs";

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult["results"];
      topratedmovies = topratedresult["results"];
      tv = tvresult["results"];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(
          text: "Filmes ❤️",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}

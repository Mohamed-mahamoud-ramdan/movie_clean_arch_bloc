import 'package:flutter/material.dart';

import 'package:movie/core/service/service_lactor.dart';
import 'package:movie/movies/data/data_source/movie_remote_data_souce.dart';
import 'package:movie/movies/presentation/screens/movie_detail_screen.dart';

import 'package:movie/movies/presentation/screens/movies_screen.dart';
import 'package:movie/movies/presentation/screens/palastine_flag.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final serviceLocator = ServiceLocator();
  serviceLocator.init();
  runApp(MyApp());
  await MovieRemoteDataSource().getPopularMovies().then((e) {
    print(e);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: PalestineFlag());
  }
}

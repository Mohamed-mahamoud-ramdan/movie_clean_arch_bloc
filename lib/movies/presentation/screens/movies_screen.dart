import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/service/service_lactor.dart';
import 'package:movie/movies/presentation/components/now_playing_component.dart';
import 'package:movie/movies/presentation/components/popular_component.dart';
import 'package:movie/movies/presentation/components/top_rated_component.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_event.dart';
import 'package:movie/movies/presentation/widgtes/see_more_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopoularMoviesEvent())
        ..add(GetTopRateMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: const SingleChildScrollView(
          key: Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NowPlayingComponent(),
              SeeMoreWidget(nameOfSee: "Popular"),
              PopularComponent(),
              SeeMoreWidget(nameOfSee: "Top Rated"),
              TopRatedComponent()
            ],
          ),
        ),
      ),
    );
  }
}

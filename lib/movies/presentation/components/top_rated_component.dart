import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_state.dart';
import 'package:movie/movies/presentation/screens/movie_detail_screen.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRaterequestState != current.topRaterequestState,
      builder: (context, state) {
        if (state.topRaterequestState == RequestState.error) {
          return Center(
            child: Text(
              "Error: ${state.topRaterequestState}",
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else if (state.topRaterequestState == RequestState.loaded) {
          return SizedBox(
            height: 180, // Correct height for the image
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.topRatedList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MovieDetailScreen(
                            id: state.topRatedList[index].id!,
                          );
                        },
                      ));
                    },
                    child: Container(
                      width: 120, // Set the width of each item
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.shade800,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: ApiConstants.imageUrl(
                              state.topRatedList[index].backdropPath!),
                          height: 180,
                          width: 120,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        // Loading indicator for the popular movies section
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

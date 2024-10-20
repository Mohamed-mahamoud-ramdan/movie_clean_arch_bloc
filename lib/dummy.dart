import 'package:equatable/equatable.dart';

List<movieeee> movieeees = const [
  movieeee(
    id: 933260,
    title: "The Substance",
    backdropPath: "/7h6TqPB3ESmjuVbxCxAeB1c9OB1.jpg",
    genreIds: [27, 18, 878],
    overview:
        "A fading celebrity decides to use a black market drug, a cell-replicating substance that temporarily creates a younger, better version of herself.",
    voteAverage: 7.391,
    releaseDate: "2024-09-07",
  ),
  movieeee(
    id: 917496,
    title: "Beetlejuice Beetlejuice",
    backdropPath: "/xi1VSt3DtkevUmzCx2mNlCoDe74.jpg",
    genreIds: [35, 14, 27],
    overview:
        "After a family tragedy, three generations of the Deetz family return home to Winter River. Still haunted by Betelgeuse, Lydia's life is turned upside down when her teenage daughter, Astrid, accidentally opens the portal to the Afterlife.",
    voteAverage: 7.203,
    releaseDate: "2024-09-04",
  ),
  movieeee(
    id: 1125510,
    title: "The Platform 2",
    backdropPath: "/3m0j3hCS8kMAaP9El6Vy5Lqnyft.jpg",
    genreIds: [878, 53, 18, 27],
    overview:
        "After a mysterious leader imposes his law in a brutal system of vertical cells, a new arrival battles against a dubious food distribution method.",
    voteAverage: 5.7,
    releaseDate: "2024-09-27",
  ),
  movieeee(
    id: 1034541,
    title: "Terrifier 3",
    backdropPath: "/xlkclSE4aq7r3JsFIJRgs21zUew.jpg",
    genreIds: [27, 53],
    overview:
        "Five years after surviving Art the Clown's Halloween massacre, Sienna and Jonathan are still struggling to rebuild their shattered lives. As the holiday season approaches, they try to embrace the Christmas spirit and leave the horrors of the past behind. But just when they think they're safe, Art returns, determined to turn their holiday cheer into a new nightmare.",
    voteAverage: 7.2,
    releaseDate: "2024-10-09",
  ),
  movieeee(
    id: 726139,
    title: "Project Silence",
    backdropPath: "/hPIWQT70wQK6akqfLXByEvr62u0.jpg",
    genreIds: [28, 53, 27, 878],
    overview:
        "Due to sudden deteriorating weather conditions, visibility on the Airport Bridge is severely impaired, leaving people stranded and at risk of the bridge collapsing due to a series of chain collisions and explosions. Amidst the chaos, the canine subjects 'Echo' from the military experiment 'Project Silence,' who were being transported in secret, break free, and all human survivors become targets of relentless attacks.",
    voteAverage: 7.1,
    releaseDate: "2024-07-11",
  ),
  // Continue adding more movieeee objects here in a similar way...
];

// ignore: camel_case_types
class movieeee extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const movieeee({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
      ];
}

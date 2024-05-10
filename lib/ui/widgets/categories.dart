import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api_service/api_service.dart';
import 'package:movie_app/model/movie_genre_byid.dart';
import 'package:movie_app/ui/pages/homepage/bloc/movie_genre_bloc.dart';
import 'package:movie_app/ui/pages/homepage/bloc/movie_genre_by_id_bloc.dart';
import 'package:movie_app/ui/widgets/movie_detail.dart';
import 'package:movie_app/ui/widgets/shimmer_widget.dart';
import 'package:movie_app/utils/consts/style_const.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  MovieGenreBloc movieGenreBloc = MovieGenreBloc();
  MovieGenreByIdBloc movieGenreByIdBloc = MovieGenreByIdBloc();
  bool currentBtn = false;
  int _currentIndex = 0;
  int genreId = 99;
  String genreName = 'Action';
  List<MoiveGenreById> movieGenre = [];
  String movieGenreImage = '';

  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    apiService.getGenreNameById(id: 28);
    movieGenreBloc.add(GetMovieGenre());
    movieGenreByIdBloc.add(GetMovieGenreByIdData(id: genreId));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieGenreBloc>(
          create: (context) => movieGenreBloc,
        ),
        BlocProvider<MovieGenreByIdBloc>(
          create: (context) => movieGenreByIdBloc,
        ),
      ],
      child: BlocBuilder<MovieGenreBloc, MovieGenreState>(
          builder: (context, state) {
        if (state is MovieGenreLoading) {
          return const ShimmerWidget();
          // return const Center(
          //   child: CircularProgressIndicator(
          //     color: Colors.white,
          //   ),
          // );
        } else if (state is MovieGenreLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: AppStyle.titleColor,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.transparent,
                ),
                child: ListView.builder(
                  itemCount: state.genre.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        _currentIndex = index;
                        genreId = state.genre[index].id;
                        // genreName = state.genre[index].name;
                        movieGenre =
                            await apiService.getGenreNameById(id: genreId);

                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _currentIndex == index
                              ? AppStyle.searchbarColor
                              : Colors.transparent,
                        ),
                        width: 100,
                        margin: const EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          left: 8,
                          right: 8,
                        ),
                        child: Center(
                          child: Text(
                            state.genre[index].name,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: _currentIndex == index
                                  ? AppStyle.activeColor
                                  : AppStyle.titleColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              BlocBuilder<MovieGenreByIdBloc, MovieGenreByIdState>(
                builder: (context, state) {
                  if (state is MovieGenreByIdLoading) {
                    return const ShimmerWidget();
                  } else if (state is MovieGenreByIdLoaded) {
                    // movieGenre = state.movieGenreById;
                    if (movieGenre.isEmpty) {
                      return SizedBox(
                        //color: Colors.tealAccent,
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movieGenreById.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (_) => MovieDetail(
                                //         movieImg: movieGenre[index].posterPath,
                                //         movieOverView: movieGenre[index].overView,
                                //         movieReleaseDate:
                                //             movieGenre[index].releaseDate,
                                //         movieName: movieGenre[index].title),
                                //   ),
                                // );
                              },
                              child: Container(
                                width: 180,
                                //height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppStyle.bgColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white10,
                                      offset: Offset(0.7, 1),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                                margin: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  right: 15,
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/original//${state.movieGenreById[index].posterPath}',
                                        placeholder: (context, url) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: AppStyle.titleColor,
                                            ),
                                          );
                                        },
                                        fit: BoxFit.cover,
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        state.movieGenreById[index].title,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          color: AppStyle.titleColor,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        state.movieGenreById[index].releaseDate,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: AppStyle.subTitleColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox(
                      //color: Colors.tealAccent,
                      height: 280,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieGenre.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MovieDetail(
                                      movieImg: movieGenre[index].posterPath,
                                      movieOverView: movieGenre[index].overView,
                                      movieReleaseDate:
                                          movieGenre[index].releaseDate,
                                      movieName: movieGenre[index].title),
                                ),
                              );
                            },
                            child: Container(
                              width: 180,
                              //height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppStyle.bgColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white10,
                                    offset: Offset(0.7, 1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                right: 15,
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/original//${movieGenre[index].posterPath}',
                                      placeholder: (context, url) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: AppStyle.titleColor,
                                          ),
                                        );
                                      },
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      movieGenre[index].title,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        color: AppStyle.titleColor,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      movieGenre[index].releaseDate,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: AppStyle.subTitleColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const ShimmerWidget();
                  }
                },
              ),
            ],
          );
        } else {
          return const ShimmerWidget();
        }
      }),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/ui/pages/homepage/bloc/popular_movie_bloc.dart';
import 'package:movie_app/ui/widgets/movie_detail.dart';
import 'package:movie_app/ui/widgets/shimmer_widget.dart';

import '../../utils/consts/style_const.dart';

class RecommendMovie extends StatefulWidget {
  const RecommendMovie({super.key});

  @override
  State<RecommendMovie> createState() => _RecommendMovieState();
}

class _RecommendMovieState extends State<RecommendMovie> {
  PopularMovieBloc popularMovie = PopularMovieBloc();

  @override
  void initState() {
    super.initState();
    popularMovie.add(GetPopularData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => popularMovie,
      child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
          builder: (context, state) {
        if (state is PopularMovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularMovieLoaded) {
          return RecommendMovieWidget(popularMovie: state.popularMovie);
        } else {
          return const ShimmerWidget();
        }
      }),
    );
  }
}

class RecommendMovieWidget extends StatefulWidget {
  const RecommendMovieWidget({
    Key? key,
    required this.popularMovie,
  }) : super(key: key);
  final List<PopularMovie> popularMovie;

  @override
  State<RecommendMovieWidget> createState() => _RecommendMovieWidgetState();
}

class _RecommendMovieWidgetState extends State<RecommendMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommend for you',
              style: TextStyle(
                color: AppStyle.titleColor,
                fontFamily: 'Montserrat',
                fontSize: 16,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                color: AppStyle.activeColor,
                fontFamily: 'Montserrat',
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.popularMovie.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieDetail(
                        movieImg: widget.popularMovie[index].posterPath,
                        movieOverView: widget.popularMovie[index].overView,
                        movieReleaseDate:
                            widget.popularMovie[index].releaseDate,
                        movieName: widget.popularMovie[index].title,
                      ),
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
                              'https://image.tmdb.org/t/p/original${widget.popularMovie[index].posterPath}',
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
                          widget.popularMovie[index].title,
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
                          widget.popularMovie[index].releaseDate,
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
        ),
      ],
    );
  }
}

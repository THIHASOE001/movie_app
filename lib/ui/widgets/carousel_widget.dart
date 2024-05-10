import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/ui/widgets/shimmer_widget.dart';
import 'package:movie_app/utils/consts/style_const.dart';
import '../pages/homepage/bloc/home_bloc_bloc.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final HomeBlocBloc homeBloc = HomeBlocBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeBlocData());
    //ApiService().getNowPlayingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocBuilder<HomeBlocBloc, HomeBlocState>(
        builder: (context, state) {
          if (state is HomeBlocLoading) {
            return const ShimmerWidget();
            // return const Center(
            //   child: CircularProgressIndicator(),
            // );
          } else if (state is HomeBlocLoaded) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Swiper(
                itemBuilder: (context, index) {
                  final image = state.movie[index].posterPath;
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          colorBlendMode: BlendMode.dstATop,
                          color: Colors.black.withOpacity(0.7),
                          imageUrl: 'https://image.tmdb.org/t/p/original$image',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.17,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: AppStyle.titleColor,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                state.movie[index].title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  //  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                state.movie[index].releaseDate,
                                style: const TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                itemCount: 4,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    size: 8,
                    space: 6,
                    color: Colors.white70,
                    activeSize: 20,
                    activeColor: Colors.teal,
                  ),
                ),
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            );
          } else {
            return const ShimmerWidget();
            // return const Text(
            //   'Loading',
            //   style: TextStyle(
            //     fontFamily: 'Montserrat',
            //     color: Colors.white,
            //     fontSize: 20,
            //   ),
            // );
          }
        },
      ),
    );
  }
}

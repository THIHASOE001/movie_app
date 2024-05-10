// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/consts/style_const.dart';
import 'package:readmore/readmore.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    Key? key,
    required this.movieImg,
    required this.movieOverView,
    required this.movieReleaseDate,
    required this.movieName,
  }) : super(key: key);

  final String movieImg;
  final String movieOverView;
  final String movieReleaseDate;
  final String movieName;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppStyle.bgColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: Text(
            widget.movieName,
            style: TextStyle(
              color: AppStyle.titleColor,
              fontSize: 22,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.heart_fill,
                size: 22,
                color: AppStyle.heartColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: DecoratedBox(
            // BoxDecoration takes the image
            decoration: BoxDecoration(
              //backgroundBlendMode: BlendMode.dstATop,
              //color: Colors.black,
              image: DecorationImage(
                  opacity: 0.2,
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/original${widget.movieImg}",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * .7,
                    width: MediaQuery.of(context).size.width * .55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://image.tmdb.org/t/p/original${widget.movieImg},',
                        placeholder: (context, url) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.date_range_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.movieReleaseDate.substring(0, 4),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.watch_later,
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      '148 min',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      CupertinoIcons.film,
                      size: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Action',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        color: Colors.amber,
                      ),
                      height: 54,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Play',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF252836),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.file_download_outlined,
                          size: 22,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF252836),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.ios_share_rounded,
                          size: 20,
                          color: AppStyle.activeColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppStyle.searchbarColor,
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            child: Text(
                              '13+',
                              style: TextStyle(
                                fontFamily: 'Montserrae',
                                fontSize: 14,
                                color: AppStyle.titleColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppStyle.searchbarColor,
                            ),
                            child: Text(
                              'Action',
                              style: TextStyle(
                                fontFamily: 'Montserrae',
                                fontSize: 14,
                                color: AppStyle.titleColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppStyle.searchbarColor,
                            ),
                            child: Text(
                              'IMAX',
                              style: TextStyle(
                                fontFamily: 'Montserrae',
                                fontSize: 14,
                                color: AppStyle.titleColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppStyle.searchbarColor,
                            ),
                            child: Text(
                              '2 Trailers',
                              style: TextStyle(
                                fontFamily: 'Montserrae',
                                fontSize: 14,
                                color: AppStyle.titleColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '2h 31min',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Story Line',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: ReadMoreText(
                    widget.movieOverView,
                    trimMode: TrimMode.Line,
                    trimLines: 4,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                    colorClickableText: Colors.teal,
                    trimCollapsedText: 'more',
                    trimExpandedText: 'less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.teal,
                      fontFamily: 'Montserrat',
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.teal,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Cast and Crew',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  //color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/profile.jpg',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Chris McKenna',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: AppStyle.titleColor,
                                  ),
                                ),
                                Text(
                                  'Directors',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: AppStyle.subTitleColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

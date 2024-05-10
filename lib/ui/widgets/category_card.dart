// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/ui/pages/homepage/bloc/movie_genre_by_id_bloc.dart';

// import '../../utils/consts/style_const.dart';

// class CategoryCard extends StatefulWidget {
//   const CategoryCard({super.key, required this.movieById, required this.title});
//   final int movieById;
//   final String title;

//   @override
//   State<CategoryCard> createState() => _CategoryCardState();
// }

// class _CategoryCardState extends State<CategoryCard> {
//   late MovieGenreByIdBloc genreById;

//   @override
//   void initState() {
//     super.initState();
//     //genreById = MovieGenreByIdBloc(widget.movieById);
//     genreById.add(GetMovieGenreById(movieId: widget.movieById));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => genreById,
//       child: BlocBuilder<MovieGenreByIdBloc, MovieGenreByIdState>(
//         builder: (context, state) {
//           if (state is MovieGenreByIdLoading) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.white,
//               ),
//             );
//           } else if (state is MovieGenreByIdLoaded) {
//             return SizedBox(
//               //color: Colors.tealAccent,
//               height: 280,
//               width: MediaQuery.of(context).size.width,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: state.genreById.length,
//                 itemBuilder: (context, index) {
//                   //state.genreById.where((element) => element.id == )

//                   var result = state.genreById
//                       .where((e) => e.genreId[0] == widget.movieById)
//                       .toList();

//                   result.map((e) => debugPrint(e.posterPath.toString()));

//                   debugPrint('====>${result}');

//                   debugPrint('${state.genreById[index][]}');

//                   return Container(
//                     width: 180,
//                     //height: 160,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: AppStyle.bgColor,
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.white10,
//                           offset: Offset(0.7, 1),
//                           spreadRadius: 1,
//                           blurRadius: 3,
//                         ),
//                       ],
//                     ),
//                     margin: const EdgeInsets.only(
//                       top: 5,
//                       bottom: 5,
//                       right: 15,
//                     ),

//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20),
//                           ),
//                           child: CachedNetworkImage(
//                             imageUrl:
//                                 'https://image.tmdb.org/t/p/original${state.genreById[index].posterPath}',
//                             fit: BoxFit.cover,
//                             height: 200,
//                             width: MediaQuery.of(context).size.width,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             '${widget.movieById}',
//                             style: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontSize: 14,
//                               color: AppStyle.titleColor,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: Text(
//                             "${state.genreById[index].genreId[0]}",
//                             style: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontSize: 12,
//                               color: AppStyle.subTitleColor,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             );
//           } else {
//             return const Center(
//               child: Text(
//                 'Something Wrong',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontFamily: 'Montserrat',
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

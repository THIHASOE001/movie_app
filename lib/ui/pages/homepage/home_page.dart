import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/ui/pages/homepage/bloc/home_bloc_bloc.dart';
import 'package:movie_app/ui/widgets/carousel_widget.dart';
import 'package:movie_app/ui/widgets/categories.dart';
import 'package:movie_app/ui/widgets/custom_appbar.dart';
import 'package:movie_app/ui/widgets/custom_search_bar.dart';
import 'package:movie_app/ui/widgets/recommend_movies.dart';
import 'package:movie_app/utils/consts/style_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBlocBloc>(
          create: (context) => HomeBlocBloc(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppStyle.bgColor,
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 20,
              ),
              child: Column(
                children: [
                  //CustomAppBar(),
                  CustomAppBar(),
                  SizedBox(
                    height: 25,
                  ),
                  CustomSearchBar(),
                  SizedBox(
                    height: 25,
                  ),
                  CarouselWidget(),
                  SizedBox(
                    height: 25,
                  ),
                  RecommendMovie(),
                  SizedBox(
                    height: 25,
                  ),
                  Category(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

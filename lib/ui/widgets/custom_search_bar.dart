import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/utils/consts/style_const.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Iconsax.search_normal,
            color: Colors.white54,
            size: 18,
          ),
          suffixIcon: Icon(
            Icons.tune_rounded,
            color: AppStyle.subTitleColor,
            size: 20,
          ),
          hintText: 'Search a title..',
          hintStyle: TextStyle(
            color: AppStyle.subTitleColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Montserrat',
          ),
          fillColor: AppStyle.searchbarColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}

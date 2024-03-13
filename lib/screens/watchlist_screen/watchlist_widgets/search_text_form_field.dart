import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../state management/search_movies_provider.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({super.key});

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {

  final searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SearchForMoviesProvider searchForMoviesProvider = Provider.of<SearchForMoviesProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.15,
      padding: const EdgeInsets.all(40),
      child: TextFormField(
        controller: searchQuery,
        onChanged: (txt){
          setState(() {
            searchForMoviesProvider
                .storeSearchForMovies(txt);
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.moviesBGColor,
          hintText: "Search",
          hintStyle: const TextStyle(
              color: AppColors.moviesDescTextColor, fontSize: 18),
          prefixIcon: const Icon(
            Icons.search_outlined,
            color: AppColors.moviesDescTextColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: AppColors.moviesDescTextColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: AppColors.moviesDescTextColor,
            ),
          ),
        ),
        style: const TextStyle(
          color: AppColors.moviesDescTextColor,
          fontSize: 15,
        ),
      ),
    );
  }
}

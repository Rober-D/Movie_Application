import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/colors.dart';

class ImageCard extends StatelessWidget {
  ImageCard({super.key,required this.title,required this.releaseDate, required this.imagePath});

  String? imagePath;
  String? title;
  String? releaseDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(imagePath!,fit: BoxFit.fill,),
        Row(
          children: [
            Expanded(child: SizedBox(),flex: 2,),
            Expanded(flex: 3,child: Text(title!,style: const TextStyle(color: Colors.white,fontSize: 17),)),
          ],
        ),
        Row(
          children: [
            Expanded(child: SizedBox(),flex: 2,),
            Expanded(flex: 3,child: Text(releaseDate!,style: const TextStyle(color: AppColors.moviesDescTextColor,fontSize: 15),)),
          ],
        ),
      ],
    );
  }
}

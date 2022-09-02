import 'dart:developer';

import 'package:data_api/models/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/routes/app_pages.dart';
import 'package:movie_app/shared/constant/commons.dart';

class ItemNowPlayingMovie extends StatelessWidget {
  final Movie movie;

  const ItemNowPlayingMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('Movie Id: ${movie.id}');
        Get.toNamed(Routes.MOVIE_DETAIL_SCREEN, arguments: movie.id);
      },
      child: Container(
        width: 180.0,
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            movie.poster != null
                ? Container(
                    width: 150.0,
                    height: 212.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.amber,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              CommonConstants.imageDomain + movie.poster!)),
                    ),
                  )
                : Container(
                    width: 150.0,
                    height: 212.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.amber,
                    ),
                  ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              movie.title,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  size: 12.0,
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  '${movie.voteAverage}/10 IMDb',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9C9C9C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

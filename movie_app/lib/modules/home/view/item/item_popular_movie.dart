import 'package:data_api/models/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/home/controller/home_controller.dart';
import 'package:movie_app/routes/app_pages.dart';

import '../../../../shared/constant/commons.dart';
import '../../../../shared/widgets/boder_widget.dart';

class ItemPopularMovie extends GetView<HomeController> {
  final Movie movie;
  const ItemPopularMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.MOVIE_DETAIL_SCREEN, arguments: movie.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            movie.poster != null
                ? Container(
                    width: 85.0,
                    height: 128.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              CommonConstants.imageDomain + movie.poster!)),
                    ),
                  )
                : Container(
                    width: 85.0,
                    height: 128.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
                  const SizedBox(
                    height: 8.0,
                  ),
                  _displayGenres(
                      controller.fetchGenresFromMovie(movie.genreIds)),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.history_outlined,
                        size: 10.0,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        movie.date,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayGenres(List<String> dataList) {
    return Wrap(
      runSpacing: 8.0,
      spacing: 8.0,
      children: dataList
          .map(
            (item) => BorderWidget(
              nameCategory: item,
            ),
          )
          .toList(),
    );
  }
}

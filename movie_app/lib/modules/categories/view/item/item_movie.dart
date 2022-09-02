import 'package:data_api/models/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../shared/constant/commons.dart';

class ItemMovie extends StatelessWidget {
  final Movie movie;
  const ItemMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movie.poster != null
        ? InkWell(
            onTap: () {
              Get.toNamed(Routes.MOVIE_DETAIL_SCREEN, arguments: movie.id);
            },
            child: SizedBox(
              width: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              CommonConstants.imageDomain + movie.poster!,
                              scale: 2.0)),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movie.title,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          )
        : Container(
            width: 120.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.amber,
            ),
          );
  }
}

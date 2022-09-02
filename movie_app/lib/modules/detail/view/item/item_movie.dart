import 'package:data_api/models/movie/movie.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/commons.dart';

class ItemMovie extends StatelessWidget {
  final Movie movie;

  const ItemMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movie.poster != null
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      CommonConstants.imageDomain + movie.poster!,
                      scale: 2.0)),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.amber,
            ),
          );
  }
}

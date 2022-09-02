import 'package:data_api/models/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/shared/constant/commons.dart';

class ItemGenreMovie extends StatelessWidget {
  final Movie movie;

  const ItemGenreMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      padding: const EdgeInsets.only(top: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          movie.poster != null
              ? Container(
                  width: 150.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              CommonConstants.imageDomain + movie.poster!))),
                )
              : Container(
                  width: 150.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.amber),
                ),
          const SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: Text(
              movie.title,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
              ),
            ),
          ),
        ],
      ),
    );
  }
}

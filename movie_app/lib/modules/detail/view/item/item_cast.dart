import 'package:data_api/models/credits/cast.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/shared/constant/commons.dart';

class ItemCast extends StatelessWidget {
  final Cast cast;

  const ItemCast({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          cast.profile != null
              ? Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            CommonConstants.imageDomain + cast.profile!)),
                  ),
                )
              : Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                ),
          const SizedBox(height: 8.0),
          Text(
            cast.name,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            cast.character,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:data_api/models/movie/review/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/shared/constant/commons.dart';

import '../../../../shared/constant/colors.dart';

class ItemReview extends StatefulWidget {
  final Review review;

  const ItemReview({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  State<ItemReview> createState() => _ItemReviewState();
}

class _ItemReviewState extends State<ItemReview> {
  bool isExpended = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            horizontalTitleGap: 8.0,
            contentPadding: EdgeInsets.zero,
            leading: widget.review.authorDetail.avatar != null
                ? Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: widget.review.authorDetail.avatar!
                                .contains('https')
                            ? NetworkImage(
                                widget.review.authorDetail.avatar!.substring(1))
                            : NetworkImage(CommonConstants.avatarDomain +
                                widget.review.authorDetail.avatar!),
                      ),
                    ),
                  )
                : _buildAvatarWithName(widget.review.author),
            title: Text(
              widget.review.author,
              style: const TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.review.authorDetail.rating != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: RatingBar.builder(
                            initialRating:
                                widget.review.authorDetail.rating?.toDouble() ??
                                    0.0,
                            maxRating: 10.0,
                            allowHalfRating: true,
                            itemSize: 12.0,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            onRatingUpdate: (value) {}),
                      )
                    : const SizedBox(),
                Text(
                  widget.review.createAt.split('T')[0],
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AppColor.neutral1,
                  ),
                )
              ],
            )),
        const SizedBox(height: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCrossFade(
              firstChild: Text(
                widget.review.content,
                textAlign: TextAlign.left,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.neutral1,
                ),
              ),
              secondChild: Text(
                widget.review.content,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.neutral1,
                ),
              ),
              crossFadeState: isExpended
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
            widget.review.content.length > 200
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpended = !isExpended;
                      });
                    },
                    child: Text(
                      isExpended
                          ? CommonConstants.showLess
                          : CommonConstants.viewMore,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AppColor.titleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatarWithName(String name) {
    var result = '';
    final words = name.split(' ');
    for (var element in words) {
      if (element.isNotEmpty && result.length < 2) {
        result += element[0];
      }
    }
    result =
        (result.length < 2 && name.length > 1) ? name.substring(0, 2) : result;

    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            AppColor.gradientViolet1,
            AppColor.gradientViolet2,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          result.toUpperCase(),
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

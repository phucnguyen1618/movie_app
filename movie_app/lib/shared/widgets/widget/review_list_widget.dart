import 'package:data_api/models/movie/review/review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/detail/controller/movie_detail_controller.dart';
import 'package:movie_app/modules/detail/view/item/item_review.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReviewListWidget extends GetView<MovieDetailController> {
  final List<Review> reviews;
  final RefreshController refreshController;
  final Function()? onLoading;

  const ReviewListWidget({
    Key? key,
    required this.reviews,
    required this.refreshController,
    this.onLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 24.0,
                height: 24.0,
              ),
              Text(
                '${reviews.length} reviews',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Expanded(
            child: SmartRefresher(
              controller: refreshController,
              onLoading: onLoading,
              enablePullUp: true,
              enablePullDown: false,
              onRefresh: () {},
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ItemReview(review: reviews[index]),
                  );
                }),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
                itemCount: reviews.length,
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.black26,
          ),
          SafeArea(
            bottom: true,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 12.0,
                            top: 0.0,
                            bottom: 0.0,
                          ),
                          hintText: 'Add review...',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

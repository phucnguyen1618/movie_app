import 'package:data_api/models/genre/genre.dart';
import 'package:data_api/models/movie/detail/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/detail/controller/movie_detail_controller.dart';
import 'package:movie_app/modules/detail/view/item/item_cast.dart';
import 'package:movie_app/modules/detail/view/item/item_review.dart';
import 'package:movie_app/modules/movie_list/view/item_movie.dart';
import 'package:movie_app/routes/app_pages.dart';
import 'package:movie_app/shared/utils/bottom_sheet_utils.dart';
import 'package:movie_app/shared/widgets/widget/review_list_widget.dart';
import '../../../shared/constant/colors.dart';
import '../../../shared/constant/commons.dart';

part 'movie_detail_screen_extension.dart';

class MovieDetailScreen extends GetView<MovieDetailController> {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Obx(
          () => controller.movieDetail.value != null
              ? SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMovieDetail(controller.movieDetail.value!),
                      const SizedBox(
                        height: 12.0,
                      ),
                      _buildCastList(),
                      const SizedBox(
                        height: 12.0,
                      ),
                      _buildReviews(),
                      const SizedBox(
                        height: 32.0,
                      ),
                      _buildRecommendationMovieList(),
                      const SizedBox(
                        height: 12.0,
                      ),
                      _buildSimilarMovieList(),
                    ],
                  ),
                )
              : const Center(
                  child: Text(
                    'Loading error',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

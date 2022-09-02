part of 'movie_detail_screen.dart';

extension MovieDetailScreenExtension on MovieDetailScreen {
  Widget _buildSimilarMovieList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Similar movies'.toUpperCase(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Obx(
            () => SizedBox(
              height: 200.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.similarMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ItemMovie(movie: controller.similarMovies[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationMovieList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'recommendations'.toUpperCase(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Obx(
            () => SizedBox(
              height: 200.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.recommendationMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ItemMovie(
                      movie: controller.recommendationMovies[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviews() {
    return Obx(() => controller.reviews.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ratings and reviews'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.reviews.length < 5
                      ? controller.reviews.length
                      : 5,
                  itemBuilder: (context, index) {
                    return ItemReview(review: controller.reviews[index]);
                  },
                ),
                const SizedBox(
                  height: 12.0,
                ),
                controller.reviews.length > 5
                    ? InkWell(
                        onTap: () {
                          BottomSheetUtils.showBottomSheetReviews(
                            child: ReviewListWidget(
                              reviews: controller.reviews,
                              refreshController: controller.refreshController,
                              onLoading: () {
                                controller.onLoading();
                              },
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'See all reviews',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: AppColor.titleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        : const SizedBox());
  }

  Widget _buildCastList() {
    return Obx(() => controller.castList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Series Cast'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.castList
                        .map((item) => InkWell(
                              child: ItemCast(cast: item),
                              onTap: () {
                                Get.toNamed(Routes.PERSON_SCREEN);
                              },
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox());
  }

  Widget _buildMovieDetail(MovieDetail movieDetail) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              movieDetail.poster != null
                  ? Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      width: 160.0,
                      height: 220.0,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              CommonConstants.imageDomain +
                                  movieDetail.poster.toString(),
                            ),
                          )),
                    )
                  : Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      width: 160.0,
                      height: 220.0,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
              Container(
                width: Get.width - 160 - 16 * 2 - 16,
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      movieDetail.title.toUpperCase(),
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
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
                          '${movieDetail.voteAverage}/10 IMDb',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: AppColor.neutral1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    _builItem(
                        title: 'Status: ',
                        content: movieDetail.status.toString()),
                    const SizedBox(
                      height: 4.0,
                    ),
                    _builItem(
                      title: 'Release date: ',
                      content: controller.displayReleaseDate(movieDetail.date),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    _builItem(
                      title: 'Time: ',
                      content: '${movieDetail.runtime} minutes',
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    _builItem(
                      title: 'Budget: ',
                      content: '${movieDetail.budget} USD',
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'Categories'.toUpperCase(),
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          _displayGenres(movieDetail.genres),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'overview'.toUpperCase(),
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          _buildViewMore(movieDetail.overview.toString()),
        ],
      ),
    );
  }

  Widget _displayGenres(List<Genre> dataList) {
    return Wrap(
      runSpacing: 4.0,
      spacing: 4.0,
      children: dataList
          .map(
            (item) => InkWell(
              onTap: () {
                Get.toNamed(Routes.CATEGORIES_SCREEN, arguments: {
                  'name': item.name,
                  'id': item.id,
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: const Color(0xFFDBE3FF),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF88A4E8),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildViewMore(
    String overview,
  ) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedCrossFade(
            firstChild: Text(
              overview,
              textAlign: TextAlign.left,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            secondChild: Text(
              overview,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            crossFadeState: controller.isExpanded.value
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: kThemeAnimationDuration,
          ),
          GestureDetector(
            onTap: controller.expanded,
            child: Text(
              controller.isExpanded.value
                  ? CommonConstants.showLess
                  : CommonConstants.readMore,
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColor.titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builItem({
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColor.titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

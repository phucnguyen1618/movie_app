part of 'home_screen.dart';

extension HomeScreenExtension on HomeScreen {
  PreferredSizeWidget _buildAppBar({
    Function()? onLeadingPressed,
    Function()? onNotifcationPressed,
  }) {
    return AppBar(
      backgroundColor: AppColor.canvasColor,
      elevation: 0.0,
      centerTitle: true,
      leading: IconButton(
        onPressed: onLeadingPressed,
        icon: Icon(
          Icons.menu,
          color: AppColor.primaryColor,
        ),
      ),
      title: Text(
        'MOVIE APP',
        style: TextStyle(
          fontSize: 16.0,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onNotifcationPressed,
          icon: Icon(
            Icons.notifications_none_outlined,
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildMovieList(
    String title, {
    Widget? child,
    Function()? onPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColor.titleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: onPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      width: 1.0,
                      color: AppColor.borderColor,
                    ),
                  ),
                  child: const Text(
                    'View more',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        child ?? const SizedBox()
      ],
    );
  }

  Widget _buildGenreTabBarList() {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 320,
        child: DefaultTabController(
          length: controller.genresList.length,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                leading: const SizedBox(),
                bottom: TabBar(
                  labelColor: AppColor.titleColor,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: controller.tabController,
                  indicatorColor: Colors.amber,
                  tabs: controller.genresList
                      .map((item) => Container(
                          padding:
                              const EdgeInsets.only(bottom: 15.0, top: 10.0),
                          child: Text(
                            item.name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )))
                      .toList(),
                  onTap: (value) {
                    controller.fetchMoviesByGenre(
                        controller.genresList[value].id.toString());
                  },
                ),
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              children: controller.genresList
                  .map((item) =>
                      GenreMoviesWidget(movieList: controller.genreForMovies))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

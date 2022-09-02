part of 'movie_list_screen.dart';

extension MovieListScreenChildren on MovieListScreen {
  PreferredSizeWidget _buildAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(Icons.arrow_back_ios, color: AppColor.titleColor,),
      ),
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 18.0,
          color: AppColor.titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

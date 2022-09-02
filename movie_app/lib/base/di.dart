import 'dart:io';
import 'package:data_api/datasource/movie_api.dart';
import 'package:data_api/network/dio_client.dart';
import 'package:data_api/network/http_overrides.dart';
import 'package:data_api/repository/impl/movie_repository_impl.dart';
import 'package:data_api/repository/movie_repository.dart';
import 'package:get/get.dart';
import 'package:movie_app/shared/constant/commons.dart';
import 'package:path_provider/path_provider.dart';

import '../data/hive_database/dao/image_cache_dao.dart';
import '../data/hive_database/hive_database.dart';

class DependencyInjection {
  static Future<void> init() async {
    HttpOverrides.global = MyHttpOverrides();

    final _dioMovieAPI = await DioClient.setUp(baseUrl: CommonConstants.baseUrl);
    final movieAPI = MovieAPI(_dioMovieAPI);
    final MovieRepository movieRepository = MovieRepositoryImpl(movieAPI);
    Get.put(movieRepository);

    //For cahe Image
    final dir = await getApplicationDocumentsDirectory();
    final _hive = HiveDatabase(dir.path);
    await _hive.init();
    Get.put(ImageCacheDAO(_hive.imageCacheBox), permanent: true);
  }
}

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_mate/model/MovieListModel.dart';
import 'package:movie_mate/utilities/session_keys.dart';

class Api extends GetConnect {
//------------------------------- oms -------------------------------
  static Api get to => Get.find();
  final error = false;
  final message = 'some error';
  var err = {'error': false, 'message': 'Network Or Other related issue'};

//------------------------------- oms -------------------------------
//   @override
//   void onInit() {
//     super.onInit();
//     httpClient.baseUrl = baseUrlCommon;
//     httpClient.addRequestModifier<dynamic>((request) {
//       request.headers['Authorization'] =
//       'Bearer ${AppSession.to.session.read(SessionKeys.TOKEN) ?? ' '}';
//       return request;
//     });
//   }

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = baseUrlCommon;
  }

  Future<MoviesModelClass> getMovieList() {
    return get(
      'movies/infinite-scroll',
    ).then((value) {
      if (kDebugMode) {
        print('movies list ========= > ${value.body}');
      }
      return MoviesModelClass.fromJson(value.body ?? err);
    });
  }
}
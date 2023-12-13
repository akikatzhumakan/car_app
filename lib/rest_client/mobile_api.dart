import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../navigation_bar/profile/model/profile.dart';

part 'mobile_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class MobileClient {
  factory MobileClient(Dio dio, {String baseUrl}) = _MobileClient;

  @GET("users/1")
  Future<Profile> getProfileData();
}

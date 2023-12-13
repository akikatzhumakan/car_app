import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../navigation_bar/home/model/example_list.dart';
part 'mobile_api_cars.g.dart';

@RestApi(
    baseUrl: 'https://private-anon-4262ef638f-carsapi1.apiary-mock.com/cars')
abstract class MobileClientCars {
  factory MobileClientCars(Dio dio, {String baseUrl}) = _MobileClientCars;

  @GET("")
  Future<List<ExampleList>> getListData();
}

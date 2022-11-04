import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioInjectable{
  
  final Dio dio = Dio();
  
  DioInjectable(){
    _initWebHandler();
  }

  void _initWebHandler(){
    dio.options.baseUrl = "https://familyfinancestest-f8319-default-rtdb.firebaseio.com/";
  }

  //Dio get initedDio => dio;

}

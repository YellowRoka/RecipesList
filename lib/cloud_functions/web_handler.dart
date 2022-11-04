import 'package:dio/dio.dart';
import 'package:ff_recept/cloud_functions/web_handler_injectable.dart';
import 'package:ff_recept/data_model/recipe_details.dart';
import 'package:ff_recept/data_model/recipes.dart';
import 'package:injectable/injectable.dart';

import '../di/module/dio_module.dart';

abstract class WebServiceInterface{
  Future< JSONRecipeDetails > getReceptdetails( int id );
  Future< JSONRecipes >       getreceptList();
}

@injectable
class WebServiceHandler extends WebServiceInterface{

  DioInjectable dioInjectable;
  late Dio dio;

  WebServiceHandler( this.dioInjectable ){
    dio = DioInjectable().dio;
  }

  @override
  Future<JSONRecipeDetails> getReceptdetails(int id) async {
    var requestResponse = await dio.get(
      "recipe_detail/$id.json",
      /*onReceiveProgress: (int recived, int total){ print('Recived: $recived, Total: $total'); }*/
    );

    return JSONRecipeDetails.fromJson(requestResponse.data);
  }
  
  @override
  Future<JSONRecipes> getreceptList() async {
    var requestResponse = await dio.get(
      "recipes.json",
      /*onReceiveProgress: (int recived, int total){ print('Recived: $recived, Total: $total'); }*/
    );

    List<RecipeData> dataList = [];
    for(var data in requestResponse.data){
      dataList.add( JSONRecipeData.fromJson(data) );
    }    

    return JSONRecipes(dataList);
  }
  
}

import 'package:dio/dio.dart';

import '../../../../../core/helpers/dio_helper.dart';

class ProductsApiService {
  Future<Response> getProducts() async {
    return await DioHelper.getData(url: 'products');
  }
  Future<Response> addProductToCart({ required int productId}) async {
    //  request body
    final data = {
      'userId': 5,
      'date': '2020-02-03', // Make sure the date is a string
      'products': [
        {'productId': productId, 'quantity': 1},

      ],
    };

    return await DioHelper.postData(url: 'carts', body: data);
  }


}

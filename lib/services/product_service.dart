
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ProductService{

  final String baseUrl = 'https://api.timbu.cloud';
  final String apiKey = '9ace44161b954d9485a9c65b9d09fe2220240707222405196809';
  final String appId = '9NF2EGTZV7VAI64';
  final String organisationId = 'f44a9f6a2d4040be8d271e892b8a3015';


  Future<dynamic> fetchData() async {
    final queryParams = {
      'organization_id': organisationId,
      "reverse_sort":"false",
      "page":"1",
      "size":"10",
      'ApiKey': apiKey,
      'Appid': appId,
    };
    final uri = Uri.https(baseUrl, '/products', queryParams);

    debugPrint(uri.toString());
    //
    // final response = await http.get(uri);
    // if (response.statusCode == 200) {
    //   return json.decode(response.body);
    // } else {
    //   throw Exception('Failed to load data');
    // }
  }


  //
  // Future<List<ProductItem>> fetchProducts() async {
  //   final response = await http.get(
  //     Uri.parse(apiUrl),
  //     headers: {
  //       'Authorization': 'Bearer $apiKey',
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     List<dynamic> body = json.decode(response.body);
  //     List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
  //     return products;
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  // }


  // var client = http.Client();
  //
  //
  // Future<ResponseModel> fetchAlbum() async {
  //   const _headers = {
  //     "organisation_id": "f44a9f6a2d4040be8d271e892b8a3015",
  //     "appId" : "76K1XU6UKT888VX",
  //     "Authorization": "Bearer $apiKey",
  //
  //   };
  //   final response = await http
  //       .get(Uri.parse(baseUrl ), headers: _headers);
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return ResponseModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
  //
  //  Future<dynamic> getProducts(String api) async{
  //   var url = Uri.parse(baseUrl + api);
  //
  //   var response = await client.get(url, headers: _headers);
  //   if(response.statusCode == 200){
  //     return response.body;
  //   }else{
  //   //   throw exception
  //   }
  //
  // }
  // Future<dynamic> post(String api) async{
  //
  // }
  // Future<dynamic> put(String api) async{
  //
  // }
  // Future<dynamic> delete(String api) async{
  //
  // }

}
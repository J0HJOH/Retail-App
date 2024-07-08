



class ApiResponse<T>{
 T data;
 bool error;
 String errorMessage;

 ApiResponse({required this.data,this.error = false, this.errorMessage =""});

//
//  Future<ApiResponse<List<ProductItem>>> getProductList(){
//
//   return http.get(baseUrl + "/products?", headers:headers )
//       .then((data){
//    if(data.statusCode == 200){
//     final jsonData = jsonDecode(data.body);
//     final productsItems = <ProductItem>[];
//     for(var item in jsonData){
//      final product = ProductItem(
//          title: item['id'],
//          images: item['photos'].length !=0? item['photos']: null ,
//          description: item[''],
//          pricing: item['current_price']);
//      productsItems.add(product);
//     }
//     return ApiResponse<List<ProductItem>>(data :productsItems);
//    }
//    return ApiResponse<List<ProductItem>>(
//        error: true,
//        errorMessage: "An error Ocurred", data: []);
//   })
//       .catchError((_)=>ApiResponse<List<ProductItem>>(
//       error: true,
//       errorMessage: "An error Ocurred", data: [])
//   );
//  }

}
import 'package:dartz/dartz.dart';
import 'package:flutter_fic7_sugiyono/common/global_variables.dart';
import 'package:flutter_fic7_sugiyono/data/models/products_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasouurce {
  Future<Either<String, ProductRemoteDatasouurce>> getProduct() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/product'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body)
          as ProductRemoteDatasouurce);
    } else {
      return const Left('Server Error, please contact admin');
    }
  }
}

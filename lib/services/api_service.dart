import 'package:dio/dio.dart';
import 'package:e_commers/models/product_model.dart';
import 'package:e_commers/models/signin_Model.dart';
import 'package:e_commers/models/signup_model.dart';

class ApiService {
  static var dio = Dio();

  static Future<List<ProductModel>> getAllProducts() async {
    var response = await dio.get('https://student.valuxapps.com/api/home');
    return ProductModel.fetch(response.data);
  }

  static Future<bool> Signin(String email, String password) async {
    var response =
        await dio.post('https://student.valuxapps.com/api/login', data: {
      'email': email,
      'password': password,
    });
    return response.data['status'];
  }

  static Future<bool> Signup(SignupModel model) async {
    var response =
        await dio.post('https://student.valuxapps.com/api/register', data: {
      'email': model.email,
      'password': model.password,
      'name': model.name,
      'phone': model.phone
    });
    print(response.data);
    return response.data['status'];
  }
}

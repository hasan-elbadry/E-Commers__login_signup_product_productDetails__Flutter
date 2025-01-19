import 'package:e_commers/models/product_model.dart';
import 'package:e_commers/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];

  Future<void> fetchData() async {
    products = await ApiService.getAllProducts();
    notifyListeners();
  }
}

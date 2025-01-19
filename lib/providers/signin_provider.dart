import 'package:e_commers/models/signin_Model.dart';
import 'package:e_commers/services/api_service.dart';
import 'package:flutter/material.dart';

class SigninProvider with ChangeNotifier {
  var email = TextEditingController();
  var password = TextEditingController();

  Future<bool> isSignin() async {
    return await ApiService.Signin(
        SigninModel(email: email.text, password: password.text));
  }
}

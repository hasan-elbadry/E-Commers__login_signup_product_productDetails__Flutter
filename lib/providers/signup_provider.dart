import 'package:e_commers/models/signup_model.dart';
import 'package:e_commers/services/api_service.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();

  Future<bool> isSignup() async {
    return await ApiService.Signup(SignupModel(
        email: email.text,
        password: password.text,
        name: name.text,
        phone: phone.text));
  }
}

import 'package:e_commers/providers/signup_provider.dart';
import 'package:e_commers/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/text_field_custom.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignupProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textFieldCustom('name', provider.name, false),
              const SizedBox(height: 30),
              textFieldCustom('phone', provider.phone, false),
              const SizedBox(height: 30),
              textFieldCustom('email', provider.email, false),
              const SizedBox(height: 30),
              textFieldCustom('password', provider.password, true),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate() &&
                      await provider.isSignup()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninScreen(),
                        ));
                  }
                },
                style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 30))),
                child: const Text(
                  'Signup',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninScreen(),
                        ));
                  },
                  child: const Text('Signin', style: TextStyle(fontSize: 20)))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget textFieldCustom(
        String name, TextEditingController controller, bool isPass) =>
    TextFormField(
        obscureText: isPass,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) return 'Please enter your $name';
          return null;
        },
        decoration: InputDecoration(
            label: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))));

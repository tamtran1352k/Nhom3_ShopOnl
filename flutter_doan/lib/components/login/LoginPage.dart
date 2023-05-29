// ignore_for_file: file_names, library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_doan/components/HomePage.dart';
import 'package:flutter_doan/utils/prefs.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_doan/components/login/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;
  var _icon = Icons.visibility;
  void _doLogin() {
    final curState = _formKey.currentState!;
    curState.save();
    if (curState.validate()) {
      final formValue = curState.value;
      if (Prefs.username.isNotEmpty && Prefs.password.isNotEmpty) {
        if (formValue["username"] == Prefs.username &&
            formValue["password"] == Prefs.password) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => HomePage()),
              (route) => false);
        } else {
          const snackBar =
              SnackBar(content: Text('Wrong username or password'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        Prefs.setUsername(formValue["username"]);
        Prefs.setPassword(formValue["password"]);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (ctx) => HomePage()), (route) => false);
      }
    } else {
      const snackBar = SnackBar(content: Text('Validation failed'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, bottom: 100),
                    child: const Text(
                      'Welcome Back',
                      style: TextStyle(color: Colors.red, fontSize: 33),
                    ),
                  ),
                  FormBuilderTextField(
                    name: "username",
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.maxLength(context, 70),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FormBuilderTextField(
                    name: "password",
                    obscureText: _hidePassword,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                            _icon = _hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off;
                          });
                        },
                        icon: Icon(_icon),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 5),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: _doLogin,
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

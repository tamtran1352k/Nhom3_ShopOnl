// ignore_for_file: file_names, sort_child_properties_last

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _hidePass = true;
  IconData icons = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/image-login/register.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 30),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Name',
                              hintText: 'Please',
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'User',
                              hintText: 'Please',
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            obscureText: _hidePass,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Enter password',
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hidePass = !_hidePass;
                                    icons = _hidePass
                                        ? Icons.visibility
                                        : Icons.visibility_off;
                                  });
                                },
                                icon: Icon(icons),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            obscureText: _hidePass,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Confirm password',
                              labelText: 'Confirm Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hidePass = !_hidePass;
                                    icons = _hidePass
                                        ? Icons.visibility
                                        : Icons.visibility_off;
                                  });
                                },
                                icon: Icon(icons),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

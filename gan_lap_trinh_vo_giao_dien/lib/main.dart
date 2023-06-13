import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/auth_page.dart';
import 'package:flutter_application_1/crud/home_page.dart';

import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/pages/Search.dart';
import 'package:flutter_application_1/provider/product_provider.dart';

import 'package:flutter_application_1/search.dart';
import 'package:flutter_application_1/user/Drawers.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthPage(),
      ),
    );
  }
}

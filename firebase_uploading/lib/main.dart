import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_uploading/provider/product_provider.dart';
import 'package:firebase_uploading/screens/home_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomePage(),
      ),
    );
  }
}

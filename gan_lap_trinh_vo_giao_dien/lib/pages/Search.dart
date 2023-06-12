import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/pages/Search_item.dart';

enum SearchCharacter { lowToHigh, highToLow, alphabetically }

class Search extends StatefulWidget {
  // final List<ProductModel> search;
  // const Search({required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchCharacter _character = SearchCharacter.alphabetically;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[300],
                filled: true,
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(),
          SearchItem(
            isBool: false,
          ),
          SearchItem(
            isBool: false,
          ),
          SearchItem(
            isBool: false,
          ),
        ],
      ),
    );
  }
}

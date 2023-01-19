import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/country_list_layout.dart';
import '../models/country.dart';
import '../const_data.dart';

import 'dart:async';

class CountryScreen extends StatelessWidget {
  static const rountName = "/country-screen";

  const CountryScreen({super.key});

  Future<String> readFileAsync(String filePath) async {
    String str = await rootBundle.loadString(filePath);
    return str;
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    final Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String? id = routeArgs["id"];
    final String? title = routeArgs["title"];
    final String? image = routeArgs["image"];

    List<Country> countries = getContries.where((c) {
      return (c.continentId == id);
    }).toList();

    //String appBarTitle = title.replaceAll(new RegExp(r'_'), " ");

    final AppBar appBar = AppBar(
      title: Text(title!),
    );
    final double appBarHeight =
        appBar.preferredSize.height + mediaQuery.padding.top;

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: (mediaQuery.size.height - appBarHeight) * 0.3,
                width: double.infinity,
                child: Hero(
                  tag: id!,
                  child: Image.asset(
                    image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Divider(
                height: (mediaQuery.size.height - appBarHeight) * 0.02,
              ),
              SizedBox(
                height: (mediaQuery.size.height - appBarHeight) * 0.68,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: countries.length,
                  itemBuilder: (ctx, i) => CountryListLayout(
                    country: countries[i],
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: mediaQuery.size.width / 1.8,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import '../screens/country_screen.dart';

class ContinentListLayout extends StatelessWidget {
  final String id;
  final String name;
  final Color color;
  final String image;

  void selectedContinent(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CountryScreen.rountName,
      arguments: {"id": id, "title": name, "image": image},
    );
  }

  const ContinentListLayout(this.id, this.name, this.color, this.image,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedContinent(context);
      },
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Hero(
          tag: id,
          child: Image.asset(image),
        ),
      ),
    );
  }
}

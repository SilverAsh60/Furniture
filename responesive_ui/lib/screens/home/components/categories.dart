import 'package:flutter/material.dart';

import '../../../models/categories.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {

  final List<Category> categories;

  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
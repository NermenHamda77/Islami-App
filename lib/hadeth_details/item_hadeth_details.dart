import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/app_colors.dart';

class ItemHadethDetails extends StatelessWidget {
  List<String> content;
  int index;
  ItemHadethDetails({required this.content , required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(content[index] ,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge,);
  }
}

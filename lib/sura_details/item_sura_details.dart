import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/app_colors.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;
  ItemSuraDetails({required this.content , required this.index});

  @override
  Widget build(BuildContext context) {
    return Text("${content.trim()}(${index+1})" ,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge,);
  }
}

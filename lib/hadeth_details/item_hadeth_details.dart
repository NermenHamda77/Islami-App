import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/app_colors.dart';

class ItemHadethDetails extends StatelessWidget {
  String content;
  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(content,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge,);
  }
}

import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/app_colors.dart';

class ItemHadethDetails extends StatelessWidget {
  String title;
  ItemHadethDetails({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title ,
      textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.bodySmall
    );
  }
}

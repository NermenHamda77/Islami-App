import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_content.dart';
import 'package:islami_app/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_app/my_theme/app_colors.dart';

class HadethItem extends StatelessWidget {
  String title;
  List<String> content;

  HadethItem({required this.title , required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName ,
        arguments: Hadeth(content: content, title: title));
      },
      child: Text(title ,
        textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_content.dart';
import 'package:islami_app/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_app/my_theme/app_colors.dart';

class HadethItem extends StatelessWidget {
  Hadeth hadeth;
  HadethItem({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName ,
        arguments: hadeth);
      },
      child: Text(hadeth.title ,
        textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall
      ),
    );
  }
}

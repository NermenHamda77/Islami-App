import 'package:flutter/material.dart';
import 'package:islami_app/sura_details/sura_content.dart';
import 'package:islami_app/sura_details/sura_details_screen.dart';
class SuraItem extends StatelessWidget {
  String suraName;
  String versesNumber;
  int index;
  SuraItem({required this.suraName , required this.versesNumber , required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName , 
        arguments: SuraContentArgs(suraName: suraName, index: index));

      },
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                suraName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                versesNumber,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),

        ],
      ),
    );
  }


}

import 'package:flutter/material.dart';
class SuraWidget extends StatelessWidget {
  String suraName;
  String versesNumber;
  SuraWidget({required this.suraName , required this.versesNumber});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

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

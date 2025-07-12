import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_content.dart';
import '../my_theme/app_colors.dart';
import 'item_hadeth_details.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadeth_details_screen";

  @override
  Widget build(BuildContext context) {
    var hadethArgs = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(
      children: [
        Image.asset(
          "assets/images/main_background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 8),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.05,
              vertical: MediaQuery.of(context).size.height*0.03,
            ),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(25)
            ),
            child:
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(hadethArgs.title ,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyMedium,),

                  ],
                ),
                Container(
                  height: 2,
                  color: Theme.of(context).primaryColor,
                ),

                SizedBox(height: 15,),

                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context , index){
                        return ItemHadethDetails(content: hadethArgs.content , index: index,);
                      },
                      separatorBuilder: (context , index){
                        return Divider(
                          thickness: 1,
                          color: Theme.of(context).primaryColor,
                        );
                      },
                      itemCount: hadethArgs.content.length
                  ),
                ),
              ],
            ),
          ),

        ),
      ],
    );
  }
}

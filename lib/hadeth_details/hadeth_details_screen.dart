import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_content.dart';
import 'package:provider/provider.dart';
import '../my_theme/app_colors.dart';
import '../providers/app_config_provider.dart';
import 'item_hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadeth_details_screen";

  @override
  Widget build(BuildContext context) {
    var hadethArgs = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        provider.isDarkMode() ?
        Image.asset(
          "assets/images/main_background_dark.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ) :
        Image.asset(
          "assets/images/main_background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
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
                color: provider.isDarkMode() ?
                AppColors.primaryDarkColor:
                AppColors.whiteColor,
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
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.isDarkMode() ?
                        AppColors.yellowColor:
                        AppColors.blackColor,
                      ),),

                  ],
                ),
                Container(
                  height: 1.5,
                  color: provider.isDarkMode() ?
                  AppColors.yellowColor:
                  AppColors.primaryLightColor,
                ),

                SizedBox(height: 15,),

                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context , index){
                        return ItemHadethDetails(content: hadethArgs.content[index]);
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

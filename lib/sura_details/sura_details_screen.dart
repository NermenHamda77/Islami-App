import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/sura_details/sura_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../my_theme/app_colors.dart';
import 'item_sura_details.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details_screen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraDetails = [];

  @override
  Widget build(BuildContext context) {
    var suraArgs = ModalRoute.of(context)?.settings.arguments as SuraContentArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    if(suraDetails.isEmpty){
      loadFile(suraArgs.index);
    }

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
                    Text(suraArgs.suraName ,
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


                suraDetails.isEmpty ?
                Center(
                  child: CircularProgressIndicator(
                    color: provider.isDarkMode() ?
                    AppColors.primaryLightColor:
                    AppColors.primaryLightColor,
                  ),
                ) :
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context , index){
                       return ItemSuraDetails(content: suraDetails[index], index: index);
                      },
                      separatorBuilder: (context , index){
                        return Divider(
                          thickness: 1,
                          color: provider.isDarkMode() ?
                          AppColors.yellowColor:
                          AppColors.primaryLightColor,
                        );
                      },
                      itemCount:suraDetails.length
                  ),
                ),
              ],
            ),
          ),

        ),
      ],
    );
  }

  void loadFile(int index) async{
    String fileContent = await rootBundle.loadString("assets/files/${index+1}.txt");
    List<String> contentLines = fileContent.split("\n");
    suraDetails = contentLines;
    setState(() {

    });
  }
}

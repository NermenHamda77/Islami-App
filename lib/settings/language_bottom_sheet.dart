import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../my_theme/app_colors.dart';
import '../providers/app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              // change language to en
              provider.changeAppLanguage("en");

            },
            child: provider.appLanguage == "en" ?
                   getSelectedItem(AppLocalizations.of(context)!.english , provider):
                   getUnselectedItem(AppLocalizations.of(context)!.english),
          ),
          SizedBox(height: 15 ,),
          InkWell(
            onTap: (){
              provider.changeAppLanguage("ar");

            },
            child: provider.appLanguage == "ar" ?
            getSelectedItem(AppLocalizations.of(context)!.arabic , provider):
            getUnselectedItem(AppLocalizations.of(context)!.arabic),
          ),

        ],
      ),
    );
  }

  Widget getSelectedItem(String text , AppConfigProvider provider){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: provider.isDarkMode() ?
            AppColors.yellowColor:
            AppColors.primaryLightColor,
          ),),
        Icon(Icons.check , size: 30,
          color:  provider.isDarkMode() ?
        AppColors.yellowColor:
        AppColors.primaryLightColor,),
      ],
    );
  }

  Widget getUnselectedItem(String text ){
    return Text(text,
      style: Theme.of(context).textTheme.bodySmall,);
  }
}

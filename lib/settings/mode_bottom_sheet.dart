import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../my_theme/app_colors.dart';
import '../providers/app_config_provider.dart';

class ModeBottomSheet extends StatefulWidget {

  @override
  State<ModeBottomSheet> createState() => _ModeBottomSheetState();
}

class _ModeBottomSheetState extends State<ModeBottomSheet> {
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
              // change mode to dark
              provider.changeAppMode(ThemeMode.dark);

            },
            child: provider.isDarkMode() ?
                   getSelectedItem(AppLocalizations.of(context)!.dark , provider):
                   getUnselectedItem(AppLocalizations.of(context)!.dark),
          ),
          SizedBox(height: 15 ,),
          InkWell(
            onTap: (){
              // change mode to light
              provider.changeAppMode(ThemeMode.light);

            },
            child: provider.isDarkMode() ?
            getUnselectedItem(AppLocalizations.of(context)!.light):
            getSelectedItem(AppLocalizations.of(context)!.light , provider),
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
        AppColors.primaryLightColor,
        ),
      ],
    );
  }

  Widget getUnselectedItem(String text ){
    return Text(text,
      style: Theme.of(context).textTheme.bodySmall,);
  }
}

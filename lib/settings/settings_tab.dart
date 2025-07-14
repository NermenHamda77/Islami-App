import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme/app_colors.dart';
import 'package:islami_app/settings/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class SettingsTab extends StatefulWidget {


  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language ,
          style: Theme.of(context).textTheme.bodyMedium,),

          SizedBox(height: 15,),

          InkWell(
            onTap: (){
              showBottomSheetModel();
            },
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( provider.appLanguage == "en" ?
                        AppLocalizations.of(context)!.english :
                        AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodySmall,),
                  Icon(Icons.arrow_drop_down , size: 30, color: AppColors.blackColor,)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  void showBottomSheetModel() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet()
    );
  }

}

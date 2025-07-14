import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme/app_colors.dart';
import 'package:islami_app/settings/language_bottom_sheet.dart';
import 'package:islami_app/settings/mode_bottom_sheet.dart';
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
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showBottomSheetModel(provider);
            },
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == "en"
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: provider.isDarkMode() ?
                      AppColors.blackColor:
                      AppColors.whiteColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: provider.isDarkMode() ?
                    AppColors.blackColor:
                    AppColors.whiteColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showModeSheet(provider);
            },
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: provider.isDarkMode() ?
                      AppColors.blackColor:
                      AppColors.whiteColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: provider.isDarkMode() ?
                    AppColors.blackColor:
                    AppColors.whiteColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheetModel(AppConfigProvider provider) {
    showModalBottomSheet(
      backgroundColor: provider.isDarkMode() ?
      AppColors.primaryDarkColor:
      AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      context: context, builder: (context) => LanguageBottomSheet());
  }

  void showModeSheet(AppConfigProvider provider) {
    showModalBottomSheet(
        backgroundColor: provider.isDarkMode() ?
        AppColors.primaryDarkColor:
        AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        context: context, builder: (context) => ModeBottomSheet());
  }

}

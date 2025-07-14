import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../providers/app_config_provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_logo.png"),
        SizedBox(
          height: 35,
        ),
        Text(
          AppLocalizations.of(context)!.holy_quran_radio,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.keyboard_arrow_left,
              size: 50,
              color: AppColors.primaryLightColor,
            ),
            Icon(
              Icons.play_arrow,
              size: 60,
              color: AppColors.primaryLightColor,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 50,
              color: AppColors.primaryLightColor,
            ),
          ],
        ),
      ],
    );
  }
}

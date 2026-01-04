
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_Theme_Provider.dart';
import '../../../utils/app_colors.dart';




class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              ///change theme to light
              themeProvider.changeTheme(ThemeMode.light);
            },
            child:
            themeProvider.isDarkMode()
                ? getUnSelectedItemWidget(
              AppLocalizations.of(context)!.light,
            )
                : getSelectedItemWidget(
              AppLocalizations.of(context)!.light,
            ),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              ///change theme to dark
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child:
            themeProvider.isDarkMode()
                ? getSelectedItemWidget(
              AppLocalizations.of(context)!.dark,
            )
                : getUnSelectedItemWidget(
              AppLocalizations.of(context)!.dark,
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppStyles.bold22black),
        Icon(Icons.check, color: AppColors.blackColor, size: 25),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(text, style: AppStyles.bold20black)],
    );
  }
}

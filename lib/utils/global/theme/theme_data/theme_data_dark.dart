import 'package:flutter/material.dart';
import 'package:session3_flutter/utils/app_constants.dart';
import 'package:session3_flutter/utils/global/theme/app_color/app_color_dark.dart';

ThemeData getThemeDataDark()=>ThemeData(
  brightness: Brightness.dark,
  primaryColor:AppColorDark.primaryColor,
  scaffoldBackgroundColor: AppColorDark.scaffoldBackgroundColor,
  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
    backgroundColor: AppColorDark.bottomNavBarBackgroundColor,
    selectedItemColor: Colors.black,
    // unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    elevation: 2,
    selectedLabelStyle: TextStyle(
      fontSize: AppConstants.s15,
      fontWeight:FontWeight.w400,
    )
  ),
  appBarTheme:const AppBarTheme(
    iconTheme: IconThemeData(
      color: AppColorDark.iconColor,
      size: AppConstants.s18,
    ),
    backgroundColor: AppColorDark.appBarBackgroundColor,
    titleTextStyle: TextStyle(
      color: AppColorDark.titleTextColor,
      fontSize: AppConstants.s18,
    ),

  ),
    dividerColor: AppColorDark.dividerColor,

);
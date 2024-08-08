import 'package:flutter/material.dart';
import 'package:session3_flutter/utils/app_constants.dart';
import 'package:session3_flutter/utils/global/theme/app_color/app_color_light.dart';

ThemeData getThemeDataLight()=>ThemeData(
  brightness: Brightness.light,
  primaryColor:AppColorLight.primaryColor,
  scaffoldBackgroundColor: AppColorLight.scaffoldBackgroundColor,
  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: AppColorLight.bottomNavBarBackgroundColor,
      selectedItemColor: Colors.white,
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
      color: AppColorLight.iconColor,
      size: AppConstants.s18,
    ),
    backgroundColor: AppColorLight.appBarBackgroundColor,
    titleTextStyle: TextStyle(
      color: AppColorLight.titleTextColor,
      fontSize: AppConstants.s18,
    ),

  ),
  dividerColor: AppColorLight.dividerColor,

);
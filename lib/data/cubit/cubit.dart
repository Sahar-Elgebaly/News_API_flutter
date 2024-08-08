import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session3_flutter/data/cubit/states.dart';
import 'package:session3_flutter/data/services/api_services.dart';
import 'package:session3_flutter/ui/screens/business_screen.dart';
import 'package:session3_flutter/ui/screens/general_news_screen.dart';
import 'package:session3_flutter/ui/screens/sports_screens.dart';
import 'package:session3_flutter/utils/app_constants.dart';
import 'package:session3_flutter/utils/color_manager.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>screens=[
    const BusinessScreen(),
    const GeneralNewsScreen(),
    const SportsScreens()
  ];
  void changeBottomNavBar(index){
    currentIndex=index;
    emit(ChangeBottomNavBarState());
  }
  List<BottomNavigationBarItem>bottomItems=[
    const BottomNavigationBarItem(label: "business",icon: Icon(Icons.business,color: Color(ColorManager.bottomNavBarItemColor),)),
    const BottomNavigationBarItem(label: "general",icon: Icon(Icons.add_chart,color: Color(ColorManager.bottomNavBarItemColor),)),
    const BottomNavigationBarItem(label: "sports",icon: Icon(Icons.sports,color: Color(ColorManager.bottomNavBarItemColor),))
  ];
  List<dynamic>business=[];

  void getBusiness(){
    emit(GetBusinessDataLoading());
    ApiServices.getData(url:AppConstants.topHeadLine, query:{
          "apiKey":AppConstants.apiKey,
          "country":"eg",
          "category":"business"
        }).then((value){
          // debugPrint(value.data["articles"][0]['title']);
          business=value.data['articles'] ;
          emit(GetBusinessDataSuccessfully());
        }).catchError((error){
          debugPrint(error.toString());
          emit(GetBusinessDataError(error.toString()));
        });
  }
  List<dynamic>general=[];

  void getGeneralNews(){
    emit(GetBusinessDataLoading());
    ApiServices.getData(url:AppConstants.topHeadLine, query:{
      "apiKey":AppConstants.apiKey,
      "country":"eg",
      "category":"general"
    }).then((value){
      general=value.data['articles'];
      emit(GetBusinessDataSuccessfully());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetBusinessDataError(error.toString()));
    });
  }
  List<dynamic>sports=[];
  void getSportsNews(){
    emit(GetBusinessDataLoading());
    ApiServices.getData(url:AppConstants.topHeadLine, query:{
      "apiKey":AppConstants.apiKey,
      "country":"eg",
      "category":"sports"
    }).then((value){
      sports=value.data['articles'] ;
      emit(GetBusinessDataSuccessfully());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetBusinessDataError(error.toString()));
    });
  }

}
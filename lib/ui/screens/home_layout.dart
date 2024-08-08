import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session3_flutter/data/cubit/cubit.dart';
import 'package:session3_flutter/data/cubit/states.dart';
import 'package:session3_flutter/data/cubit/theme_cubit.dart';
import 'package:session3_flutter/utils/color_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit() ..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:const Text("News App"),
              actions: [
                IconButton(onPressed: (){
                  context.read<ThemeCubit>().toggleTheme();
                }, icon:Theme(
                  data: ThemeData(
                    iconTheme:const IconThemeData(
                      color:Colors.white,
                      size: 20,
                      
                    )
                  ),
                    child: const Icon( Icons.brightness_2)))
              ],
            ),
            backgroundColor:const Color(ColorManager.scaffoldColor),

            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex:cubit.currentIndex ,
              onTap: (index){
                cubit.changeBottomNavBar(index);

              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}

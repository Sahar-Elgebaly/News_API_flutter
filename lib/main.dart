import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session3_flutter/data/cubit/theme_cubit.dart';
import 'package:session3_flutter/data/services/api_services.dart';
import 'package:session3_flutter/ui/screens/home_layout.dart';
import 'package:session3_flutter/utils/global/theme/theme_data/theme_data_dark.dart';
import 'package:session3_flutter/utils/global/theme/theme_data/theme_data_light.dart';

import 'data/cubit/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState,
            home: const HomeLayout(),

          );
        },
      ),
    );
  }
}

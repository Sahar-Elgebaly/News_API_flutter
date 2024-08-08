import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session3_flutter/data/cubit/cubit.dart';
import 'package:session3_flutter/data/cubit/states.dart';
import 'package:session3_flutter/ui/widget/article_item.dart';

class SportsScreens extends StatelessWidget {
  const SportsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit() ..getSportsNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit
              .get(context)
              .sports;
          return ConditionalBuilder(
              condition: state is! GetBusinessDataLoading,
              builder: (context) =>
                  ListView.separated(
                      itemBuilder: (context, index) {
                                                     //context ,
                        return buildArticleItem(context ,list[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Divider(color: Colors.white),
                        );
                      },
                      itemCount: list.length),
              fallback: (context) =>
              const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
//return ListView.separated(
//         itemBuilder: (context, index) {
//           return buildArticleItem("");
//         },
//         separatorBuilder: (context, index) {
//           return const Padding(
//             padding:EdgeInsets.only(left:15,right:15),
//             child: Divider(color: Colors.white),
//           );
//         },
//         itemCount: 5);

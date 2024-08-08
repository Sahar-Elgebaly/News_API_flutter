import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:session3_flutter/ui/screens/article_details_view.dart';
import 'package:session3_flutter/utils/color_manager.dart';
//                      context,
Widget buildArticleItem(context,article) {
  var urlToImage = article['urlToImage'];
  return
    InkWell(
    onTap:(){
      Navigator.push(context, MaterialPageRoute(builder:(context) => ArticleDetailsView(url:"${article["url"]}")),);
    },
    child:
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ConditionalBuilder(
                  condition: urlToImage != null,
                  builder: (context) => Image.network(
                        "${article['urlToImage']}",
                        width: 300,
                        height: 180,
                      ),
                  fallback: (context) => const Icon(
                        Icons.error,
                        color: Color(ColorManager.bottomNavBarItemColor),
                      ))),
          const SizedBox(height: 3,),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              "${article["title"]}",
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          const SizedBox(height: 3,),
          Text(
            "${article['publishedAt']}",
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    ),
  );
}

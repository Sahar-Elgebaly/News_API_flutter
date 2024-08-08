import 'package:flutter/material.dart';
import 'package:session3_flutter/utils/color_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsView extends StatefulWidget {
  final String url;

  const ArticleDetailsView({super.key, required this.url});

  @override
  State<ArticleDetailsView> createState() => _ArticleDetailsViewState();
}

class _ArticleDetailsViewState extends State<ArticleDetailsView> {
 final WebViewController controller=WebViewController();
  @override
  void  initState(){
    super.initState();
    controller
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back)),
      ),
      body:WebViewWidget(
          controller: controller)
    );
  }
}

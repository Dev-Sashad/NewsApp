import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsapp/ui/screens/views/ArticleWebView/article_viewModel.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  // bool _loading;
  // @override
  // void initState() {
  //   super.initState();
  //   _loading = true;
  // }

  @override
     Widget build(BuildContext context) {
      return ViewModelProvider<ArticleViewModel>.withConsumer(
        viewModelBuilder: () => ArticleViewModel(),
        builder: (context, model, child) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.blue[800],
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.png',
          height: 50,
          width: 100,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: WebView(
              initialUrl: widget.blogUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: ((WebViewController webViewController) {
                _completer.complete(webViewController);
              }),
              onPageStarted: (start){
                model.setBusy(true);
              },
              onPageFinished: (finish) {
                // setState(() {
                //   _loading = false;
                // });
                model.setBusy(false);
              },
            ),
          ),
          // _loading
          //     ? Container(
          //         alignment: FractionalOffset.center,
          //         child: CircularProgressIndicator(
          //           strokeWidth: 2.0,
          //         ),
          //       )
          //     : Center()
        ],
      ),
    );
  }
      );
     }
}

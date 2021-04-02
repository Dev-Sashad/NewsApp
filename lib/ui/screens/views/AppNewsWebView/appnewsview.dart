import 'package:flutter/material.dart';
import 'package:newsapp/ui/screens/views/ArticleWebView/article_web_view.dart';
import 'package:newsapp/utils/helpers.dart';

class AppNewsView extends StatefulWidget {
  final String blogUrl, description, imageUrl, time, source, author, title;
  AppNewsView(
      {this.blogUrl,
      this.author,
      this.description,
      this.imageUrl,
      this.source,
      this.title,
      this.time});

  @override
  _AppNewsViewState createState() => _AppNewsViewState();
}

class _AppNewsViewState extends State<AppNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          title: Padding(
            padding: const EdgeInsets.only(top:10),
            child: Image.asset(
              'assets/logo.png',
              height: 50,
              width: 100,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Container(
        
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Card(
                elevation: 0.0,
               clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                // child:Flexible(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600),
                  ),
               //)
                ),

                SizedBox(height: 10),
              
              Card(
                elevation: 0.0,
               clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  )),

              SizedBox(height: 10),

             Card(
               elevation: 0.0,
              clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
               //child: Flexible(
                  child: Text(widget.description,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                     ),
              // )
                ),
              
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticleView(
                                  blogUrl: widget.blogUrl.toString(),
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(blurRadius: 4, color: Colors.black12)
                        ],
                        color: Colors.blueAccent),
                    child: Text(
                      'Read more',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                  
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Date: ${formatDateTime(DateTime.parse(widget.time))}',
                      style: TextStyle(fontSize: 17, color: Colors.black))),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Source: ${widget.source}',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
             
              ])
            ],
          ),
        )));
  }
}

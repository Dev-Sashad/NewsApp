import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/model/news_model.dart';
import 'package:newsapp/ui/screens/views/AppNewsWebView/appnewsview.dart';
import 'package:newsapp/ui/screens/views/CategoryNews/category_news.dart';
import 'package:newsapp/utils/helpers.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryView(
                        category: categoryName.toLowerCase(),
                      )));
        },
        child: Container(
          margin: EdgeInsets.only(right: 15),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 120,
                    height: 60,
                    fit: BoxFit.cover),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26,
                ),
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class BlogTile extends StatelessWidget {
 final Data newModel;

  BlogTile({this.newModel});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AppNewsView(
                        blogUrl: newModel.url.toString(),
                        author: newModel.source.toString(),
                        source: newModel.source.toString(),
                        imageUrl: newModel.image.toString(),
                        title: newModel.title.toString(),
                        time: newModel.publishedAt.toString(),
                        description: newModel.description.toString(),
                      )));
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
            height: 130,
            child: Row(
              children: [
                Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: (newModel.image == null) ? SizedBox(width: 1) :Image.network(
                        newModel.image,
                        width: 10,
                        fit: BoxFit.fill,
                        scale: 3.0,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 100,
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
                      ),
                    )),
                    SizedBox(width:10),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    newModel.title == null ? Text ('') : Text(
                      newModel.title,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                    ),
                    newModel.description == null ? Text ('') : Text(
                      newModel.description,
                      style: TextStyle(color: Colors.black54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      newModel.source == null ? Text ('') : Text(newModel.source.toString(), style: TextStyle(color: Colors.blue)),
                      newModel.publishedAt == null ? Text ('') : Text(formatDate(newModel.publishedAt).toString(),
                          style: TextStyle(color: Colors.blue)),
                    ])
                  ],
                ))
              ],
            )));
  }
}

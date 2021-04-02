import 'package:flutter/material.dart';
import 'package:newsapp/core/model/news_model.dart';
import 'package:newsapp/ui/screens/views/CategoryNews/category_viewModel.dart';
import 'package:newsapp/ui/widget/views.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class CategoryView extends StatefulWidget {
  final String category;
  CategoryView({this.category});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  @override
  Widget build(BuildContext context) {
      return ViewModelProvider<CategoryNewsViewModel>.withConsumer(
        viewModelBuilder: () => CategoryNewsViewModel(category: widget.category),
        builder: (context, model, child) {
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
          title: Image.asset(
            'assets/logo.png',
            height: 50,
            width: 100,
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body:Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: FutureBuilder<List<Data>>(
                future: model.fetchnews(),
                builder:(context, snapshot) {
                  if (snapshot.hasData) {
                            return ListView(
                                //scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: snapshot.data
                                    .map((feed) => BlogTile(newModel: feed))
                                    .toList());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                              "An Error Occured",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ));
                          }
                          return Center(
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator()));
                 
                },
              )
        ));
  }
      );
  }
}

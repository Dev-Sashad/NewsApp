import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsapp/core/model/news_model.dart';
import 'package:newsapp/ui/screens/views/dashboard/home_viewModel.dart';
import 'package:newsapp/ui/widget/views.dart';
import 'package:newsapp/utils/navigationbloc/navigation_bloc.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class Home extends StatefulWidget with NavigationStates {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
      return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(children: [
              Image.asset(
                'assets/logo.png',
                height: 50,
                width: 100,
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 7),
                height: 70,
                child: ListView.builder(
                    itemCount: model.fetchCategoryNews().length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageUrl: model.fetchCategoryNews()[index].imageUrl,
                        categoryName: model.fetchCategoryNews()[index].categoryName,
                      );
                    }),
              ),
            ]),
          ),
          centerTitle: true,
          elevation: 0.0,
          toolbarHeight: 120,
        ),
        body:  Container(
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




import 'package:newsapp/core/model/categoryModel.dart';
import 'package:newsapp/core/model/error_model.dart';
import 'package:newsapp/core/model/news_model.dart';
import 'package:newsapp/core/services/newSevices.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/utils/baseModel.dart';
import 'package:newsapp/utils/locator.dart';

class HomeViewModel extends BaseModel {
  final News news = locator<News>();
 // List<CategoryModel> categories = [];
  // Future<NewsModel> articles;

  Future<List<Data>> fetchnews() async {
    //setBusy(true);
    var articles = await news.getNews();
    if (articles is ErrorModel) {
      print(articles.error);
      notifyListeners();
      throw Exception('Failed to load internet');
    }
    print(articles);
    return articles;
  }

   List<CategoryModel> fetchCategoryNews(){
    var categories  = getCategories();
    if (categories  is ErrorModel) {
      // print(categories);
      notifyListeners();
      throw Exception('Failed to load internet');
    }
    print(categories );
    
    return  categories  ;
  }
}
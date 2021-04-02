import 'package:flutter/cupertino.dart';
import 'package:newsapp/core/model/error_model.dart';
import 'package:newsapp/core/model/news_model.dart';
import 'package:newsapp/core/services/newSevices.dart';
import 'package:newsapp/utils/baseModel.dart';
import 'package:newsapp/utils/locator.dart';

class CategoryNewsViewModel extends BaseModel {
  final CategoryNews news = locator<CategoryNews>();
  final String category;
  CategoryNewsViewModel({@required this.category});
//  Future<NewsModel> articles;

  Future<List<Data>> fetchnews() async {
    //setBusy(true);
    var result = await news.getCategoryNews(" & categories = $category");
    if (result is ErrorModel) {
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
    }
    print(result);
    return result;
  }

}
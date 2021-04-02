import 'package:flutter/cupertino.dart';
import 'package:newsapp/core/model/error_model.dart';
import 'package:newsapp/core/model/news_model.dart';
import 'package:newsapp/core/services/newSevices.dart';
import 'package:newsapp/utils/baseModel.dart';
import 'package:newsapp/utils/locator.dart';

class OtherNewsViewModel extends BaseModel {
  final OtherNews news = locator<OtherNews>();
  final String path;
  OtherNewsViewModel({@required this.path});

  Future<List<Data>> fetchnews() async {
    //setBusy(true);
    var result = await news.getOtherNews(path);
    if (result is ErrorModel) {
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
    }
    print(result);
    return result ;
  }

}
import 'package:newsapp/core/model/error_model.dart';
import 'package:newsapp/core/model/news_model.dart';
import 'package:newsapp/core/services/index.dart';
import 'package:newsapp/utils/helpers.dart';
import 'package:newsapp/utils/http/api_keys.dart';
import 'package:newsapp/utils/http/paths.dart';

class News {
 getNews() async {
 try {
      final articles =  await http.get(Paths.path + apiKey + Paths.country);
      if (articles is ErrorModel) {
        print("ERROR");
        showErrorToast('Fetch failed');
        print(articles.error);
        var data = articles.error;
        List<Data> postList = List<Data>.from(
            data.map((item) => NewsModel.fromJson(item)));
         return ErrorModel(postList);

      }

      var data = articles.data["data"];
      List<Data> articleList = List<Data>.from(
          data.map((item) => Data.fromJson(item)));
      return articleList;
    } catch (e) {
      print(e.toString());
      return ErrorModel('$e');
    }
}
}

class CategoryNews {
 getCategoryNews(String category) async {
    try {
      final articles =  await http.get(Paths.path + apiKey + Paths.country + category);
      if (articles is ErrorModel) {
        print("ERROR");
        showErrorToast('Fetch failed');
        print(articles.error);
        var data = articles.error;
        List<Data> postList = List<Data>.from(
            data.map((item) => NewsModel.fromJson(item)));
         return ErrorModel(postList);

      }

      var data = articles.data["data"];
     
      List<Data> articleList = List<Data>.from(
          data.map((item) => Data.fromJson(item)));
      return articleList;
    } catch (e) {
      print(e.toString());
      return ErrorModel('$e');
    }
}
}

class OtherNews {
 getOtherNews(String path) async {
 try {
      final articles =  await http.get(Paths.path + apiKey + path);
      if (articles is ErrorModel) {
        print("ERROR");
        showErrorToast('Fetch failed');
        print(articles.error);
        var data = articles.error;
        List<Data> postList = List<Data>.from(
            data.map((item) => NewsModel.fromJson(item)));
         return ErrorModel(postList);

      }

      var data = articles.data["data"];
    
      List<Data> articleList = List<Data>.from(
          data.map((item) => Data.fromJson(item)));
      return articleList;
    } catch (e) {
      print(e.toString());
      return ErrorModel('$e');
    }
}
}



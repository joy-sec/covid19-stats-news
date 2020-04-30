import 'dart:convert';

import 'package:covid19/model/country.dart';
import 'package:covid19/model/summary.dart';
import 'package:covid19/model/news.dart';
import 'package:http/http.dart';

class NetworkHelper {
  String urlSummary = "https://coronavirus-19-api.herokuapp.com/all";
  String urlBD =
      "https://coronavirus-19-api.herokuapp.com/countries/bangladesh";
  String urlAll = "https://coronavirus-19-api.herokuapp.com/countries";
  String urlNews = "https://covid19-stats-and-news.herokuapp.com/news";

  Future<Summary> getSummary() async {
    final response = await get(urlSummary);
    if (response.statusCode == 200) {
      return Summary.fromJson(jsonDecode(response.body));
    } else {
      throw "request error";
    }
  }

  Future<Country> getBangladeshInfo() async {
    final response = await get(urlBD);
    if (response.statusCode == 200) {
      return Country.fromJson(jsonDecode(response.body));
    } else {
      throw "request error";
    }
  }

  Future<List<Country>> getAllCountryInfo() async {
    List<Country> list = new List();
    final response = await get(urlAll);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        Country item = Country.fromJson(i);
        list.add(item);
      }
      return list;
    } else {
      throw "request error";
    }
  }

  Future<List<News>> getNews() async {
    List<News> list = new List();
    final response = await get(urlNews);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        News news = News.fromJson(i);
        list.add(news);
      }
      return list;
    } else {
      throw "response error";
    }
  }
}

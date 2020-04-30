import 'package:covid19/data/network.dart';
import 'package:covid19/model/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPaper();
  }
}

class _NewsPaper extends State<NewsPage> {
  NetworkHelper _networkHelper = NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        builder: (context, snapData) {
          if (snapData.hasData) {
            List<News> list = snapData.data;
            return ListView.builder(itemBuilder: (context, index) {
              News news = list[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      ImageWidget(news.thumbnailurl),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              news.title,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                            Text(
                              news.description,
                              style: GoogleFonts.oswald(
                                  textStyle: TextStyle(fontSize: 15)),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  news.source,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue),
                                ),
                                Text(
                                  news.pubDate,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: _networkHelper.getNews(),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  String imgUrl;

  ImageWidget(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    if (imgUrl == "")
      return Image.asset("assets/covid_icon.png",width: 50,height: 50,);
    else
      return Image.network(imgUrl,width: 50,height: 50,);
  }
}

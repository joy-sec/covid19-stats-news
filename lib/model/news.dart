class News {
  String source;
  String url;
  String title;
  String description;
  String thumbnailurl;
  String pubDate;

  News(
      {this.source,
        this.url,
        this.title,
        this.description,
        this.thumbnailurl,
        this.pubDate});

  News.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    url = json['url'];
    title = json['title'];
    description = json['description'];
    thumbnailurl = json['thumbnailurl'];
    pubDate = json['pubDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['url'] = this.url;
    data['title'] = this.title;
    data['description'] = this.description;
    data['thumbnailurl'] = this.thumbnailurl;
    data['pubDate'] = this.pubDate;
    return data;
  }
}

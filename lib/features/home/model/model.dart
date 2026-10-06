class ArticleModel{
   String? author;
   String ?title;
   String ?content;
   String ?description;
    String? publishedAt;
   String ?urlToImage;
  ArticleModel({ this.author,  this.title,  this.description,  this.publishedAt,  this.urlToImage,this.content});
  ArticleModel.fromjson (Map<String,dynamic> json){
content=json["content"];
    urlToImage=json["urlToImage"];
     publishedAt=json["publishedAt"];
     author=json["author"];
     title=json["title"];
     description= json["description"];
  }
}
import 'package:flutter/material.dart';
import 'package:news/core/app_text_style.dart';
import 'package:news/features/home/model/model.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});
final ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 25,),
          
      ),
        centerTitle: true,
        title: Text("News Detail",style: AppTextStyle.black_700_14,),
      actionsPadding: EdgeInsets.all(5),
      actions: [Icon(Icons.favorite_outline_rounded,color: Colors.black,size: 25,)],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                child: Image.network(model.urlToImage??"")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(model.author??"aya",style: AppTextStyle.black_600_12,),
                  Spacer(),
                  TextButton.icon(onPressed: (){}, label: Text("204",style: AppTextStyle.black_600_12,),icon: Icon(Icons.favorite_border,color: Colors.black,size: 15,),)
                ],
              ),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 12,
                children: [
                  Text(model.author??"aya ahmed",style: AppTextStyle.black_600_12,),
                  Text(model.publishedAt??"",style: AppTextStyle.black_600_12,),

                ],
              ),
            )

            ,Text(model.description??"",style: AppTextStyle.black_600_12,),
            SizedBox(height: 12,),
            Text(model.content??"",style:AppTextStyle.black_600_12)
          ],
        ),
      ),
          );
  }
}

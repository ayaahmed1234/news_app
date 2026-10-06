import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/app_text_style.dart';
import 'package:news/features/details/view.dart';
import 'package:news/features/home/model/home_cubit.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, required this.query});
final String query;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..Search(query: query),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Search results", style: AppTextStyle.black_600_18,),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 25,)),
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    if(state is HomeLoading){
      return Center(child: CircularProgressIndicator(
        color: Colors.green,
      ),);
    } if(state is HomeFailure){
      return Text(state.msg);
    }if(state is HomeSuccess){
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:state.model.length,
        itemBuilder: (context, index) {
          final item=state.model[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(model: item),));
            },
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      item.urlToImage ??
                          "https://images.search.yahoo.com/search/images;_ylt=A2RSjLzsWcVq5QIAyu6JzbkF;_ylu=Y29sbwNldS13ZXN0LTEEcG9zAzUwBHZ0aWQDBHNlYwNzcg--?fr=mcafee&p=wimahe&imgurl=https%3A%2F%2Fmiro.medium.com%2Fv2%2Fresize%3Afit%3A1358%2F1*L54l07kO7pscG_ZOHlZQnQ.png",
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            item.author ?? "aya ahmed",
                            style: AppTextStyle.black_600_12,
                          ),
                          Text(
                            item.description ?? "aya ahmed",
                            maxLines: 3,
                            style: AppTextStyle.black_600_12,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            textAlign: TextAlign.right,
                            item.publishedAt ?? "aya ahmed",
                            style: AppTextStyle.grey_600_10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },);
    }
    return SizedBox();
  },
),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/app_text_style.dart';
import 'package:news/features/details/view.dart';
import 'package:news/features/home/model/home_cubit.dart';
import 'package:news/features/search/view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "all",
    "Politic",
    "Sport",
    "Education",
    "all",
    "Politic",
    "Sport",
    "Education",
  ];

  int selectdindex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..GetArticles(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SearchScreen(),));
              },
              icon: Icon(Icons.search, color: Color(0xffC000000), size: 22),
            ),
            Icon(Icons.notifications_none, color: Color(0xff000000), size: 22),
          ],
          leading: Icon(Icons.menu, color: Color(0xffC000000), size: 22),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 5,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Breaking News", style: AppTextStyle.black_600_16),
                    Spacer(),
                    Text("Show More", style: AppTextStyle.blue_600_12),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                child: Image.asset("assets/images/home.png"),
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool isselected = index == selectdindex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectdindex = index;
                        });
                        if(categories[index]=="All"){
                          context.read<HomeCubit>().GetArticles();
                        }
                        else{
                          context.read<HomeCubit>().Search(query: categories[index]);
                        }
                      },

                      child: Container(
                        // width: 388.00000316461296,
                        // height: 39,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: isselected ? Color(0xffFFA500) : Colors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categories[index],
                            style: AppTextStyle.black_400_16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("News For You", style: AppTextStyle.black_600_16),
                    Spacer(),
                    Text("Show More", style: AppTextStyle.blue_600_12),
                  ],
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    );
                  }
                  if (state is HomeFailure) {
                    return Text(state.msg);
                  }
                  if (state is HomeSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.model.length,
                        scrollDirection: Axis.vertical,

                        itemBuilder: (context, index) {
                          final item = state.model[index];
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
                                      item.urlToImage ?? "https://www.fingerlakes1.com/wp-content/uploads/2025/11/Keuka-College-US-News.jpg",
                                      errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                        "https://www.fingerlakes1.com/wp-content/uploads/2025/11/Keuka-College-US-News.jpg",
                                        fit: BoxFit.cover,
                                      );
                                    },
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
                        },
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

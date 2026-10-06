import 'package:flutter/material.dart';
import 'package:news/features/search/search_results.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
final TextEditingController controller=TextEditingController();
class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 12),
        child:

        Row(
          spacing: 12,
          children: [
            Expanded(
              child: TextField(onSubmitted: (value) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResults(query: value),));
              },
                controller: controller,

                decoration:
                InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                        ,borderSide: BorderSide(
                    color: Color(0xffF0EFF0)
                  )
                  ),
              filled: true,
              fillColor: Color(0xffF0EFF0)
              , focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                        ,borderSide: BorderSide(
                    color: Color(0xff0088FF)
                  )
                  ),

                  suffixIcon: IconButton(
                    iconSize: 15,
                      color: Colors.grey,
                      onPressed: (){
                      controller.clear();
                      }, icon: Icon(Icons.close,color:Colors.white,)),
                  prefixIcon: Icon(Icons.search,color: Color(0xff8A8184),size: 14,),
                  hintText: "'Search"
                      ,hintStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.shade200
                )
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.clear,
              child: Text("Cancel",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0E0AB1)
              )),
            )
          ],
        ),
       ),
    );
  }
}

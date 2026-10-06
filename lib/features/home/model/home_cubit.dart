import 'package:dio/dio.dart';
import 'package:news/features/home/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final dio=Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        filter: (options, args) {
          //  return !options.uri.path.contains('posts');
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  Future<void> GetArticles()async{
    emit(HomeLoading());
    try{
      Response response=await dio.get("https://newsapi.org/v2/top-headlines",
      queryParameters: {
        "apiKey":"e0c221a680c947a59918871cb9ef9d80","country":"us"
      });
      final articles=response.data["articles"] as List;
      final article=articles.map((e) => ArticleModel.fromjson(e),).toList();
      emit(HomeSuccess(model: article));
    }
    on DioException catch(e){
      emit(HomeFailure(msg: e.message??"Dio error"));
    }
    catch(e){
      emit(HomeFailure(msg: e.toString()));

    }
  }
  Future<void> Search({required String query})async{
    emit(HomeLoading());
    try{
      Response response=await dio.get("https://newsapi.org/v2/everything",queryParameters: {
        "apiKey":"e0c221a680c947a59918871cb9ef9d80","q":query

      });
      final articles=response.data["articles"] as List;
      final article=articles.map((e) => ArticleModel.fromjson(e),).toList();
      emit(HomeSuccess(model: article));
    }
    on DioException catch(e){
      emit(HomeFailure(msg: e.message??"dio error"));
      
    }catch(e){
      emit(HomeFailure(msg: e.toString()));
    }
  }
}

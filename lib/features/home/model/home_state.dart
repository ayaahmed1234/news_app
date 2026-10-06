part of 'home_cubit.dart';

abstract class HomeState {}

 class HomeInitial extends HomeState {}
 class HomeLoading extends HomeState {}
 class HomeFailure extends HomeState {
  final String msg;
  HomeFailure({required this.msg});
}
 class HomeSuccess extends HomeState {
  final List<ArticleModel> model;
  HomeSuccess({required this.model});
 }

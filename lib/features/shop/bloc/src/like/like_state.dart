part of 'like_bloc.dart';

abstract class LikeState {}

class LikeInitialState extends LikeState {}

class LikeLoadingState extends LikeState {}

class LikeLoadedState extends LikeState {
  final int count;
  final bool isLiked;
  LikeLoadedState({required this.isLiked, required this.count});
}

class LikeFailureState extends LikeState {}
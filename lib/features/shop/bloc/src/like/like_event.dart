part of 'like_bloc.dart';

abstract class LikeEvent {}

class LikeLoadEvent extends LikeEvent {
  final String objectId;
  LikeLoadEvent({required this.objectId});
}
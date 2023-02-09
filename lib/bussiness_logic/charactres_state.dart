part of 'charactres_cubit.dart';

@immutable
abstract class CharactresState {}
class CharactresInitial extends CharactresState {}

class charactersloaded extends CharactresState{

  final CharResponse charResponse;
  charactersloaded(this.charResponse);

}

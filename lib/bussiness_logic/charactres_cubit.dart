import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/data/model/chracters.dart';
import 'package:meta/meta.dart';

import '../data/repostry/characters_reposotry.dart';

part 'charactres_state.dart';

class CharactresCubit extends Cubit<CharactresState> {
  final CharactersRepositry charactersRepositry;



  CharactresCubit(this.charactersRepositry) : super(CharactresInitial());

  void  getAllCharacters() {
    charactersRepositry.getAllCharacters().then((character) {
      emit(charactersloaded(character));

    });

  }
}

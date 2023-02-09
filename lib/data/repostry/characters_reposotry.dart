import 'package:bloc_flutter/data/web_services/characters_web_services.dart';

import '../model/chracters.dart';

class CharactersRepositry
{
  final CharactersWebServices charactersWebServices ;
  CharactersRepositry(this.charactersWebServices);



    Future <dynamic > getAllCharacters() async {
        final characters = await charactersWebServices.getAllCharacters();
        //return characters.map((character) => CharResponse().fromJson(character));
        return CharResponse.fromJson(characters);


    }
}
import 'package:bloc_flutter/data/model/chracters.dart';
import 'package:bloc_flutter/data/repostry/characters_reposotry.dart';
import 'package:bloc_flutter/prsentation/Screens/screens/Characters_Screen.dart';
import 'package:bloc_flutter/prsentation/Screens/screens/charactersdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bussiness_logic/charactres_cubit.dart';
import 'constants/Strings.dart';
import 'data/web_services/characters_web_services.dart';

class AppRouter {
  late CharactersRepositry charactersRepositry;

  late CharactresCubit charactresCubit;

  AppRouter() {
    charactersRepositry = CharactersRepositry(CharactersWebServices());
    charactresCubit = CharactresCubit(charactersRepositry);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreeen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactresCubit,
            child: const CharactersScreen(),
          ),
        );
      case charactersDetailsScreeen:
        final characters = settings.arguments as Characterss;
        return MaterialPageRoute(
            builder: (_) =>  CharactresDetailsScreen(characters: characters));
    }
  }
}

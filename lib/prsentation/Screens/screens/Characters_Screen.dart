import 'package:bloc_flutter/bussiness_logic/charactres_cubit.dart';
import 'package:bloc_flutter/constants/My_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/chracters.dart';
import '../widgets/chractersItem.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
   List<Characterss>? allcharacters;
   List<Characterss>? searchedForCharacter;
   List <Characterss>? li = [

   ];

  bool isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchFiled() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColor.myGrey,
      decoration: const InputDecoration(
        hintText: 'Find a Character',
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18, color: MyColor.myGrey),
      ),
      style: const TextStyle(fontSize: 18, color: MyColor.myGrey),
      onChanged: (searchedCharacter) {
        addSearchForItemToSearchList(searchedCharacter);
      },
    );
  }

  void addSearchForItemToSearchList(String searchedCharacter) {
    searchedForCharacter = allcharacters!
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarAction() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: MyColor.myGrey,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(
              Icons.search,
              color: MyColor.myGrey,
            )),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchedForCharacter?.clear();
    });
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactresCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactresCubit, CharactresState>(
        builder: (context, state) {
      if (state is charactersloaded) {
        allcharacters = (state).charResponse.results;
        return buildLoadedListWidget();
      } else {
        return showLoudingIndicator();
      }
    });
  }

  Widget buildLoadedListWidget() {
    print(allcharacters.toString());
    return SingleChildScrollView(

      child: Container(
        color: MyColor.myWhite,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _searchTextController.text.isEmpty? allcharacters?.length:searchedForCharacter?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 1,
          mainAxisExtent: 250,
        ),
        itemBuilder: (ctx, index) {
          return CharactersItem(

            characterss: _searchTextController.text.isEmpty?  allcharacters![index]:searchedForCharacter![index],
          );
        });
  }

  Widget showLoudingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColor.myYellow,
      ),
    );
  }

  appBarTittle() {
    return const Text(
      'Characters',
      style: TextStyle(fontSize: 30, color: MyColor.myGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myGrey,
      appBar: AppBar(
        leading: isSearching? BackButton(color: MyColor.myGrey,):Container(),
        backgroundColor: MyColor.myYellow,
        title: isSearching ? _buildSearchFiled() : appBarTittle(),
        actions: _buildAppBarAction(),
      ),
      body: buildBlocWidget(),
    );
  }
}

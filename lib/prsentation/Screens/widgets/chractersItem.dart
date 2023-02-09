import 'package:bloc_flutter/constants/My_Colors.dart';
import 'package:bloc_flutter/data/model/chracters.dart';
import 'package:flutter/material.dart';

import '../../../constants/Strings.dart';

class CharactersItem extends StatelessWidget {
  final Characterss characterss;

  const CharactersItem({Key? key, required this.characterss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: MyColor.myGrey, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context, charactersDetailsScreeen, arguments: characterss ),
        child: GridTile(
          child: Hero(
            tag: characterss.id!,
            child: Container(
              color: MyColor.myGrey,
               child: characterss.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                       width: double.infinity,
                       height: double.infinity,
                       fit: BoxFit.cover,
                       placeholder: 'assests/images/wait.gif',
                       image: characterss.image!,
                    )
                   : Image.asset('assests/images/person.png'),
            ),
          ),
          footer: Container(
            color: Colors.black54,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.bottomCenter,
            child: Text(
              '${characterss.name}',
              style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColor.myWhite,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

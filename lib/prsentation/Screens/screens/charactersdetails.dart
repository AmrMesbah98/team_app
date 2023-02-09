import 'package:bloc_flutter/constants/My_Colors.dart';
import 'package:bloc_flutter/data/model/chracters.dart';
import 'package:flutter/material.dart';

class CharactresDetailsScreen extends StatelessWidget {
  final Characterss characters;

  const CharactresDetailsScreen({super.key, required this.characters});

  Widget buildSilverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColor.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          characters.name!,
          style: TextStyle(
              color: MyColor.myWhite,
              fontSize: 30,
              fontWeight: FontWeight.bold),
          //textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: characters.id!,
          child: Image.network(
            characters.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: TextStyle(
              color: MyColor.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        TextSpan(
            text: value,
            style: TextStyle(
              color: MyColor.myWhite,
              fontSize: 16,
            )),
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColor.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSilverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('status :', characters.status!),
                      buildDivider(270),
                      characterInfo(
                          'Natural of Character :', characters.species!),
                      buildDivider(150),
                      characterInfo('gender :', characters.gender!),
                      buildDivider(260),
                      characterInfo('Time of Relase :', characters.created!),
                      buildDivider(200),
                      characterInfo(
                          'Link of Data :', characters.episode!.join(' / ')),
                      buildDivider(220),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

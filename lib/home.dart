import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/widgets/characterTile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/Rick_and_Morty_Logo.png', fit: BoxFit.contain, height: 56),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getCaracterListFromAPI(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            final characters = snapshot.data!;
            List<Widget> characterTiles = [];
            for (int x = 0; x < characters.length; x++) {
              characterTiles.add(CharacterTile(character: characters[x]));
            }
            return SingleChildScrollView(
                child: Column(children: characterTiles));
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty/api.dart';
import 'package:rick_and_morty/widgets/characterTile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Rick and Morty characters!"),
            const SizedBox(width: 12),
            Image.asset('assets/logo_white.png',
                fit: BoxFit.contain, height: 48),
          ],
        ),
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
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                 return CharacterTile(character: characters[index]);
              },
            );
            /*
            List<Widget> characterTiles = [];
            for (int x = 0; x < characters.length; x++) {
              characterTiles.add(CharacterTile(character: characters[x]));
            }
            return SingleChildScrollView(
                child: Column(children: characterTiles));
                */
          }
        },
      ),
    );
  }
}

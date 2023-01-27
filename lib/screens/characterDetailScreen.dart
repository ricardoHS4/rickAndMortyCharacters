import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/widgets/character_field.dart';

class CharacterDetailScreen extends StatelessWidget {
  Character character;
  CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Widget> episodesTiles() async {
      List<Widget> tiles = [];
      for (int x = 0; x < character.episode.length; x++) {
        Episode episode = await getEpisodeFromAPI(character.episode[x]);
        tiles.add(ListTile(
            title: Text(episode.name), subtitle: Text(episode.air_date)));
      }
      return Column(children: tiles);
    }

    Widget episodesField() {
      return SingleChildScrollView(
        child: FutureBuilder(
          future: episodesTiles(),
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
              return snapshot.data!;
            }
          },
        ),
      );
    }

    Widget characterInfo() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CharacterField(character: character),
            const SizedBox(height: 16),
            const Text(
              "Episodes:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Expanded(child: episodesField()),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: characterInfo(),
    );
  }
}


/*
class CharacterDetailScreen extends StatefulWidget {
  Character character;
  CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  Color statusColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    

    
  }
}


*/
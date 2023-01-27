import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/screens/characterDetailScreen.dart';

class CharacterTile extends StatelessWidget {
  //imagen del personaje, el nombre del personaje y un indicador de color para el status
  Character character;

  CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWithStatus() {
      Color statusColor = Colors.green;
      switch (character.status) {
        case "Dead":
          statusColor = Colors.red;
          break;
        case "unknown":
          statusColor = Colors.grey;
          break;
      }

      return Container(
        width: 50.0,
        height: 50.0,
        //padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          /*color: const Color(0xff7c94b6),
          image: DecorationImage(
            image: NetworkImage(character.image),
            fit: BoxFit.cover,
          ),*/
          shape: BoxShape.circle,
          border: Border.all(
            color: statusColor,
            width: 2.0,
          ),
        ),
        child: ClipRRect(borderRadius: BorderRadius.circular(25), child: Hero(tag: character.id,child: Image.network(character.image))),
      );
    }

    return ListTile(
      dense: false,
      visualDensity: VisualDensity(vertical: 0),
      leading: imageWithStatus(),
      //leading: CircleAvatar(backgroundImage: NetworkImage(imageURL)),
      title: Text(character.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CharacterDetailScreen(character: character)),
        );
      },
    );
  }
}

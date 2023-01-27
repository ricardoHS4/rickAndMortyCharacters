import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';

class CharacterField extends StatefulWidget {
  Character character;
  CharacterField({Key? key, required this.character}) : super(key: key);

  @override
  _CharacterFieldState createState() => _CharacterFieldState();
}

class _CharacterFieldState extends State<CharacterField> {
  Color statusColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    switch (widget.character.status) {
      case "Alive":
        statusColor = Colors.green;
        break;
      case "Dead":
        statusColor = Colors.red;
        break;
      case "unknown":
        statusColor = Colors.grey;
        break;
    }

    Widget circleStatusButton() {
      return InkWell(
        onTap: () {
          setState(
            () {
              switch (widget.character.status) {
                case "Alive":
                  widget.character.status = "Dead";
                  break;
                case "Dead":
                  widget.character.status = "unknown";
                  break;
                case "unknown":
                  widget.character.status = "Alive";
                  break;
              }
            },
          );
        },
        child: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    Widget characterImageAndStatus() {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width/2-20,
          height: MediaQuery.of(context).size.width/2-20,
          child: Stack(
            children: [
              Hero(
                  tag: widget.character.id,
                  child: Image.network(widget.character.image)),
              Positioned(top: 10, left: 10, child: circleStatusButton()),
            ],
          ),
        ),
      );
    }

    Widget TextWithStyle(String text) {
      return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      );
    }

    Widget characterDetails() {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWithStyle("Name: ${widget.character.name}"),
              TextWithStyle("Species: ${widget.character.species}"),
              TextWithStyle("Gender: ${widget.character.gender}"),
              TextWithStyle("Origin: ${widget.character.origin['name']}"),
              TextWithStyle("Location: ${widget.character.location['name']}"),
            ],
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        characterImageAndStatus(),
        characterDetails(),
      ],
    );
  }
}

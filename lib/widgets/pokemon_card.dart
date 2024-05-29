import 'package:flutter/material.dart';
import 'package:flutter_prueba/models/PokeModel.dart';
import 'package:flutter_prueba/models/pokemon_screen_data.dart';
import 'package:flutter_prueba/widgets/pokemon_card_background.dart';
import 'package:flutter_prueba/widgets/pokemon_card_data.dart';

class PokemonCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final List<Types> types;
  final List<Moves> moves;
  final int height;
  final int weight; 
  final String url;
const PokemonCard({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.moves,
    required this.height,
    required this.weight,
    required this.url
  }) : super(key: key);
BoxDecoration getContainerDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.grey.withOpacity(0.24),
          width: 1,
        ),
      );
@override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(7),
        enableFeedback: true,
        splashColor: Colors.red[50],
        onTap: () => {
          Navigator.pushNamed(
            context,
            "/details",
            arguments: PokemonScreenData(id, name, image, types, moves, height, weight, url),
          )
        },
      child:Container(
      padding: const EdgeInsets.all(7),
      decoration: getContainerDecoration(),
      child: Stack(
        children: [
          PokemonCardBackground(id: id),
          PokemonCardData(name: name, image: image, types: types),
        ],
      ),
      )
      )
    );
  }
}
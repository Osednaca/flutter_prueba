import 'package:flutter/material.dart';
import 'package:flutter_prueba/models/PokeModel.dart';
import 'package:velocity_x/velocity_x.dart';

class PokemonMoveList extends StatelessWidget {
  final List<Moves> moves;
  const PokemonMoveList({Key? key, required this.moves}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: moves.length,
        itemBuilder: (context, index) {
          return PokemonMoveContainer(type: moves[index].moves);
        });
  }
}

class PokemonMoveContainer extends StatelessWidget {
  final String type;
  const PokemonMoveContainer({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: type.text.xl.white.makeCentered(),
    ).wh(120, 10);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_prueba/models/PokeModel.dart';
import 'package:flutter_prueba/utils/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class PokemonTypeList extends StatelessWidget {
  final List<Types> types;
  const PokemonTypeList({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: types.length,
        itemBuilder: (BuildContext context, int index) {
          return PokemonTypeContainer(type: types[index].types);
        });
  }
}

class PokemonTypeContainer extends StatelessWidget {
  final String type;
  const PokemonTypeContainer({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getBackGroundColor(type),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: type.text.xl.white.makeCentered(),
    ).wh(60, 30);
  }
}
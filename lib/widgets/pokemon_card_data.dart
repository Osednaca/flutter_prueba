import 'package:flutter/material.dart';
import 'package:flutter_prueba/models/PokeModel.dart';
import 'package:flutter_prueba/widgets/pokemon_type_list.dart';
import 'package:velocity_x/velocity_x.dart';
class PokemonCardData extends StatelessWidget {
  final String image;
  final String name;
  final List<Types> types;
  const PokemonCardData({
    Key? key,
    required this.name,
    required this.image,
    required this.types,
  }) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const Divider(),
        Text(
          "${name[0].toUpperCase()}${name.substring(1)}",
          style: const TextStyle(
            fontSize: 21,
            color: Colors.black87,
          ),
        ),
        const Divider(),
        PokemonTypeList(types: types).h(80).pOnly(top: 5),
      ],
    );
  }
}
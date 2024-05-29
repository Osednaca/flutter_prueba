import 'package:flutter_prueba/models/PokeModel.dart';

class PokemonScreenData {
  final int id;
  final String name;
  final String image;
  List<Types> types;
  List<Moves> moves;
  final int height;
  final int weight;
  final String url;

  PokemonScreenData(this.id, this.name, this.image, this.types, this.moves, this.height, this.weight, this.url);
}
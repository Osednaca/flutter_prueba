import 'package:flutter/material.dart';
import 'package:flutter_prueba/models/PokeModel.dart';
import 'package:flutter_prueba/widgets/pokemon_card.dart';

class PokemonGrid extends StatefulWidget {
  final List<Pokemon> pokemon;
  const PokemonGrid({Key? key, required this.pokemon}) : super(key: key);
@override
  _PokemonGridState createState() => _PokemonGridState();
}
class _PokemonGridState extends State<PokemonGrid> {
  String query = '';
  List<Pokemon> searchResults = [];

@override
void initState() {
  searchResults = widget.pokemon;
}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width > 1000)
        ? 5
        : (width > 700)
            ? 4
            : (width > 450)
                ? 3
                : 2;
return Column(
        children: [
          TextField(
            onChanged: onQueryChanged,
            decoration: InputDecoration(
            labelText: 'Search',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
            ),
          ),
          Container(
          width: double.infinity,
          height: 600,
          child: GridView.count(
            padding: const EdgeInsets.all(7),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            semanticChildCount: 250,
            childAspectRatio: 200 / 244,
            physics: const BouncingScrollPhysics(),
            children: searchResults
                .map(
                  (pokemon) => PokemonCard(
                    id: pokemon.id,
                    name: pokemon.name,
                    image: pokemon.imageUrl,
                    types: pokemon.types,
                    moves: pokemon.moves,
                    height: pokemon.height,
                    weight: pokemon.weight,
                    url: pokemon.url,
                  ),
                )
                .toList(),
          ))
        ]
    );
  }

  void onQueryChanged(String query) {
    setState(() {
      searchResults = widget.pokemon
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

}
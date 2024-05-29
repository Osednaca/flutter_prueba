import 'dart:convert';

import 'package:flutter_prueba/models/pokemon_result.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_prueba/models/PokeModel.dart';

import '../widgets/pokemos_grid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pokemon> pokemons = [];
  String url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=20";
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadPokemons();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isLoading) {
          setState(() {
            loadPokemons();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

    void loadPokemons() async {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(Uri.parse(url));
      var decodedJson = jsonDecode(response.body);

      var results = decodedJson["results"];
      url = decodedJson["next"];

      var pokemons = List.from(results)
          .map((pokemonResult) => PokemonResult.fromMap(pokemonResult))
          .toList();

      for (var result in pokemons) {
        getPokemonData(result.url);
      }
    }

  void getPokemonData(String url) async {
    var response = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(response.body);
    decodedJson['url'] = url;

    var pokemon = Pokemon.fromMap(decodedJson);
    setState(() {
      pokemons.add(pokemon);
      pokemons.sort((a, b) => a.id.compareTo(b.id));
      isLoading = false;
    });
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Pokedex"),
        ),
        body: PokemonGrid(pokemon: pokemons),
      );
    }
}
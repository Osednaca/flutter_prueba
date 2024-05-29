import 'package:flutter/material.dart';
import 'package:flutter_prueba/models/pokemon_screen_data.dart';
import 'package:flutter_prueba/widgets/detail_back_button.dart';
import 'package:flutter_prueba/widgets/detail_data.dart';
import 'package:flutter_prueba/widgets/detail_image.dart';
import 'package:flutter_prueba/widgets/detail_title.dart';
class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as PokemonScreenData;
return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DetailImage(image: arguments.image),
            DetailTitle(id: arguments.id, name: arguments.name, url: arguments.url),
            DetailData(id: arguments.id, name: arguments.name, height: arguments.height, weight: arguments.weight, types: arguments.types, moves: arguments.moves),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const DetailBackButton(),
    );
  }
}
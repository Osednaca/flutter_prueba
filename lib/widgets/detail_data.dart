import 'package:flutter/material.dart';
import 'package:flutter_prueba/models/PokeModel.dart';
import 'package:flutter_prueba/widgets/pokemon_move_list.dart';
import 'package:flutter_prueba/widgets/pokemon_type_list.dart';
import 'package:velocity_x/velocity_x.dart';
class DetailData extends StatelessWidget {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<Types> types;
  final List<Moves> moves;
  const DetailData({Key? key, required this.id, required this.name, required this.height, required this.weight, required this.types, required this.moves}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: 500,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(71),
          topRight: Radius.circular(71),
        ),
      ),
      child: Column(
        children: [
          PokemonTypeList(types: types).h(80).pOnly(top: 10),
          PokemonMoveList(moves: moves).h(40).pOnly(top: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WieghtHeightContainer(
                  title: "Weight", value: "${weight / 10} KG"),
              WieghtHeightContainer(
                  title: "Height", value: "${height / 10} M")
            ],
          ).pOnly(top: 20),
        ],
      ),
    );
  }
}

class WieghtHeightContainer extends StatelessWidget {
  final String title;
  final String value;
  const WieghtHeightContainer(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        value.text.black.xl2.bold.make(),
        const SizedBox(
          height: 10,
        ),
        title.text.gray500.make()
      ],
    );
  }
}
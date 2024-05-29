class Pokemon {
  int id;
  int height;
  String name;
  List<Moves> moves;
  List<Types> types;
  int weight;
  String url;

  Pokemon(this.id, this.height, this.name, this.moves, this.types, this.weight, this.url);

  String get imageUrl {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }

  Pokemon copyWith({
    int? id,
    int? height,
    String? name,
    List<Moves>? moves,
    List<Types>? types,
    int? weight,
    String? url,
  }) {
    return Pokemon(
      id ?? this.id,
      height ?? this.height,
      name ?? this.name,
      moves ?? this.moves,
      types ?? this.types,
      weight ?? this.weight,
      url ?? this.url,
    );
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      map['id'],
      map['height'],
      map['name'],
      List<Moves>.from(map['moves']?.map((x) => Moves.fromMap(x))),
      List<Types>.from(map['types']?.map((x) => Types.fromMap(x))),
      map['weight'],
      map['url'],
    );
  }
}

class Moves {
  String moves;

  Moves({
    required this.moves,
  });

  Moves copyWith({
    String? moves,
  }) {
    return Moves(
      moves: moves ?? this.moves,
    );
  }

  factory Moves.fromMap(Map<String, dynamic> map) {
    return Moves(
      moves: map['move']['name'],
    );
  }
}

class Types {
  String types;
  Types({
    required this.types,
  });

  Types copyWith({
    String? types,
  }) {
    return Types(
      types: types ?? this.types,
    );
  }

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      types: map['type']['name'],
    );
  }
}
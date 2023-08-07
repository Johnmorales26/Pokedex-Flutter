import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon_entity_dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonCard(this.pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          height: 130,
          color: const Color(0x80CCCCCC),
          child: _PokemonCardContent(pokemon),
        ),
      ),
    );
  }
}

class _PokemonCardContent extends StatelessWidget {
  final PokemonEntity pokemon;

  const _PokemonCardContent(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: _DataPokemon(pokemon)),
        Expanded(flex: 1, child: _ImagePokemon(pokemon.id))
      ],
    );
  }
}

class _ImagePokemon extends StatelessWidget {
  final int idPokemon;

  const _ImagePokemon(this.idPokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: FadeInImage(
        placeholder: const AssetImage('assets/images/load_image.png'),
        image: NetworkImage(getImageUrl(idPokemon)),
      ),
    );
  }

  String getImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }
}

class _DataPokemon extends StatelessWidget {
  final PokemonEntity pokemon;

  const _DataPokemon(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(formatNumberId(pokemon.id),
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            Text(capitalizeFirstLetter(pokemon.name),
                style: Theme.of(context).textTheme.titleLarge)
          ]),
    );
  }

  String formatNumberId(int id) {
    return "#${id.toString().padLeft(3, '0')}";
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}

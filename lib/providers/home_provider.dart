import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/models/pokemon_entity_dart';
import 'package:pokedex_flutter/models/pokemon_page.dart';

class HomeProvider extends ChangeNotifier {
  List<PokemonEntity>? pokemons = [];

  final String _baseUrl = 'pokeapi.co';
  final String _pokemonUrl = '/api/v2/pokemon/';
  final String _pokemonDetailsUrl = '/api/v2/pokemon/';
  final int _limit = 100;
  final int _offset = 0;

  HomeProvider() {
    getPokemonPerPage();
  }

  Future<void> getPokemonPerPage() async {
    var url = Uri.https(
        _baseUrl, _pokemonUrl, {'limit': '$_limit', 'offset': '$_offset'});
    var response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    var pokemonPage = PokemonPage.fromJson(decodeData);
    List<PokemonEntity> pokemonList = [];
    for (var pokemon in pokemonPage.results ?? []) {
      var pokemonEntity = await getPokemonByName(pokemon.name);
      pokemonList.add(pokemonEntity);
    }
    pokemons = pokemonList;
    notifyListeners();
  }

  Future<PokemonEntity> getPokemonByName(String name) async {
    var url = Uri.https(_baseUrl, '$_pokemonDetailsUrl$name');
    var response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    return PokemonEntity.fromJson(decodeData);
  }
}

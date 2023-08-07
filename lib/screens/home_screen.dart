import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex_flutter/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/pokemon_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
      ),
      body: _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: true);
    final pokemons = homeProvider.pokemons;
    if (pokemons!.isNotEmpty) {
      return _PokemonList();
    } else {
      return _DownloadingDataMessage();
    }
  }
}

class _PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    var pokemons = homeProvider.pokemons;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
          itemCount: pokemons!.length,
          itemBuilder: (_, index) => PokemonCard(pokemons[index])),
    );
  }
}

class _DownloadingDataMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Downloading\nData...',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: 64),
          Lottie.asset(
            'assets/raw/pokeball_downloading.json', // Ruta de tu archivo Lottie
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:showwcase_pokemon/bloc/fetch_pokemons/fetch_pokemon_bloc.dart';
import 'package:showwcase_pokemon/bloc/fetch_pokemons/fetch_pokemon_event.dart';
import 'package:showwcase_pokemon/models/pokemon.dart';
import 'package:showwcase_pokemon/shared/app_colors.dart';
import 'package:showwcase_pokemon/ui/widgets/pokemon_item.dart';

class AllPokemon extends StatelessWidget {
  const AllPokemon({
    Key? key,
    required FetchPokemonBloc fetchPokemonBloc,
    required this.pokemonList,
    required this.isLoading,
  })  : _fetchPokemonBloc = fetchPokemonBloc,
        super(key: key);

  final FetchPokemonBloc _fetchPokemonBloc;
  final List<Pokemon> pokemonList;
  final ValueNotifier<bool> isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: mecuryGrey,
      ),
      child: LazyLoadScrollView(
        onEndOfPage: () {
          _fetchPokemonBloc.add(const FetchPokemonNextPage());
        },
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                itemCount: pokemonList.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return PokemonItem(
                    key: UniqueKey(),
                    pokemon: pokemonList[index],
                  );
                },
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder: (BuildContext context, bool value, Widget? child) {
                return value
                    ? const Center(
                  child: CircularProgressIndicator(color: ceruleanBlue,),
                )
                    : const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}

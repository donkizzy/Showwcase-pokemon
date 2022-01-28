import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:showwcase_pokemon/ui/views/splash.dart';
import 'bloc/favourite_pokemons/favourite_pokemons_bloc.dart';

void main()async {
  // Initialize hive
  await Hive.initFlutter();
  // Opening the box
  await Hive.openBox('pokemonBox');
  await Hive.openBox('nextUrl');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritePokemonsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Splash(),
      ),
    );
  }
}

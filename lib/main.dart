import 'package:flutter/material.dart';
import 'package:pokedex_flutter/providers/home_provider.dart';
import 'package:pokedex_flutter/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Flutter',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            displaySmall: TextStyle(
                fontFamily: 'Circularstd',
                fontSize: 36,
                fontWeight: FontWeight.w900),
            headlineMedium: TextStyle(
                fontFamily: 'Circularstd',
                fontSize: 30,
                fontWeight: FontWeight.w900),
            headlineSmall: TextStyle(
                fontFamily: 'Circularstd',
                fontSize: 24,
                fontWeight: FontWeight.w900),
            titleLarge: TextStyle(fontFamily: 'Circularstd'),
            titleMedium: TextStyle(
                fontFamily: 'Circularstd',
                fontSize: 16,
                fontWeight: FontWeight.w700),
            bodyLarge: TextStyle(fontFamily: 'Circularstd'),
            bodyMedium: TextStyle(fontFamily: 'Circularstd'),
            bodySmall: TextStyle(fontFamily: 'Circularstd'),
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (_) => const HomeScreen(),
      },
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider(), lazy: false),
    ], child: const MyApp());
  }
}

import 'package:first_project/blocs/company_cubit.dart';
import 'package:first_project/ui/screens/add_company.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:first_project/ui/screens/search_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Pour pouvoir utiliser les SharePreferences avant le runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Instanciation du Cubit
  final CompanyCubit companyCubit = CompanyCubit();

  // Chargement des entreprises
  companyCubit.loadCompanies();

  runApp(BlocProvider<CompanyCubit>(
    create: (_) => companyCubit,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/addCompany': (context) => AddCompagny(),
        '/searchAddr': (context) => const SearchAddress()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

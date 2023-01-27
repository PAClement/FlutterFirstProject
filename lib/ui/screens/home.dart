import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/company.dart';
import 'package:first_project/blocs/company_cubit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 82, 91),
        title: const Text('Liste des entreprises'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color(0xff0F2027),
              Color(0xff203A43),
              Color(0xff2C5364)
            ])),
        child: BlocBuilder<CompanyCubit, List<Company>>(
          builder: (context, companie) {
            return ListView.builder(
              itemCount: companie.length,
              itemBuilder: (BuildContext context, int index) {
                final Company company = companie[index];
                return Card(
                  color: Colors.green,
                  child: ListTile(
                    textColor: Colors.white,
                    title: Text(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        company.name),
                    subtitle: Text(
                        style: const TextStyle(color: Colors.red),
                        '${company.address.street}, ${company.address.city}'),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("/addCompany");
        },
      ),
    );
  }
}

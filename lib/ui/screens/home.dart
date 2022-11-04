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
        title: const Text('MyDigitalMap'),
      ),
      body: BlocBuilder<CompanyCubit, List<Company>>(
        builder: (context, companie) {
          return ListView.builder(
            itemCount: companie.length,
            itemBuilder: (BuildContext context, int index) {
              final Company company = companie[index];

              return ListTile(
                title: Text(company.name),
                subtitle:
                    Text('${company.address.street}, ${company.address.city}'),
              );
            },
          );
        },
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

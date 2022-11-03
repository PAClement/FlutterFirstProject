import 'package:first_project/ui/screens/add_company.dart';
import 'package:flutter/material.dart';
import '../../models/company.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final List<Company> companies = const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDigitalMap'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final item = companies[index];

            return ListTile(
              title: Text(item.name),
            );
          },
          itemCount: companies.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {Navigator.of(context).pushNamed("/addCompany")},
      ),
    );
  }
}

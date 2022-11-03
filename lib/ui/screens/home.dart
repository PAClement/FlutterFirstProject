import 'package:first_project/ui/screens/add_company.dart';
import 'package:flutter/material.dart';
import '../../models/company.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDigitalMap'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final item = _companies[index];

            return ListTile(
              title: Text(item.name),
            );
          },
          itemCount: _companies.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final Company? company =
              await Navigator.of(context).pushNamed("/addCompany") as Company?;

          if (company != null) {
            setState(() {
              _companies.add(company);
            });
          }
        },
      ),
    );
  }
}

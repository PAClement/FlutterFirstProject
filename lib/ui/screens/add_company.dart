import 'package:flutter/material.dart';
import '../../models/company.dart';
import '../../models/address.dart';

class AddCompagny extends StatelessWidget {
  AddCompagny({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  Address? address;

  final _addrController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add compagny'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.apartment),
                    border: OutlineInputBorder(),
                    labelText: 'Entreprise name',
                  ),
                ),
              ),
              Card(
                child: TextFormField(
                  controller: _addrController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.abc_outlined),
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                  readOnly: true,
                  onTap: () async {
                    address = await Navigator.of(context)
                        .pushNamed("/searchAddr") as Address?;

                    if (address != null) {
                      _addrController.text =
                          "${address!.street} - ${address!.postcode} - ${address!.city}";
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && address != null) {
                    final String name = _nameController.text;

                    final Company company = Company(0, name, address!);
                    Navigator.of(context).pop(company);
                  }
                },
                child: const Text('add new entreprise'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

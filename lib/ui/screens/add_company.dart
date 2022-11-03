import 'package:flutter/material.dart';
import '../../models/company.dart';

class AddCompagny extends StatelessWidget {
  AddCompagny({Key? key}) : super(key: key);

  final _textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add compagny'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.apartment),
                  border: OutlineInputBorder(),
                  labelText: 'Entreprise name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: _textFieldController,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final String name = _textFieldController.text;

                    final Company company = Company(0, name);
                    Navigator.of(context).pop(company);
                  }
                },
                child: const Text('ADD'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

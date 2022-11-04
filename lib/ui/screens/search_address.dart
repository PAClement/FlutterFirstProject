import 'package:flutter/material.dart';
import '../../models/address.dart';
import '../../repositories/AddressRepository.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<Address> _addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Address'),
      ),
      body: Card(
        child: Column(children: [
          Card(
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
                labelText: 'Entreprise Address',
              ),
              onChanged: (value) async {
                if (value.length >= 3) {
                  final AddressRepository addrRepo = AddressRepository();

                  final List<Address> data =
                      await addrRepo.fetchAddresses(value);

                  setState(() {
                    _addresses = data;
                  });
                }
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _addresses.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _addresses[index];

                return ListTile(
                  title: Text(item.street),
                  subtitle: Text("${item.city} - ${item.postcode}"),
                  onTap: () {
                    Navigator.of(context).pop(item);
                  },
                );
              },
              separatorBuilder: ((BuildContext context, int index) {
                return const Divider(height: 0);
              }),
            ),
          ),
        ]),
      ),
    );
  }
}

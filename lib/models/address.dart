class Address {
  final String street;
  final String postcode;
  final String city;

  const Address(this.street, this.postcode, this.city);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};

    final String street = properties['name'];
    final String postcode = properties['postcode'];
    final String city = properties['city'];

    return Address(street, postcode, city);
  }
}

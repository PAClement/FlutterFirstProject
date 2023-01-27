import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/company.dart';

class PreferencesRepository {
  Future<void> saveCompanies(List<Company> companies) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final Company company in companies) {
      listJson.add(jsonEncode(company.toJson()));
    }
    prefs.setStringList('companies', listJson);
  }

  Future<List<Company>> loadCompanies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = prefs.getStringList('companies') ?? [];
    final List<Company> companies = [];
    for (String json in listJson) {
      final Map<String, dynamic> map = jsonDecode(json);
    }
    // A compléter
    return [];
  }
}

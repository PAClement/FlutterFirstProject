import '../models/company.dart';
import '../models/address.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class CompanyCubit extends Cubit<List<Company>> {
  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit() : super([]);

  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    emit([]);
  }

  /// Méthode pour ajouter une entreprise
  void addCompany(Company company) {
    emit([...state, company]);
  }
}

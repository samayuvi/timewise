// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> fr_FR = {
  "to_do": "À faire",
  "doing": "Faire",
  "done": "Terminé",
  "history": "Histoire",
  "item_title": "Titre de la tâche",
  "item_from": "Description",
  "add_item": "Ajouter une tâche",
  "summary": "Résumé",
  "status": "Statut",
  "start_date": "Date de début",
  "completed_date": "Date d'achèvement",
  "total_time_spent": "Temps total passé",
  "start": "Démarrer",
  "stop": "Arrête",
  "time_tracker": "Suivi du temps",
  "all": "Tout",
  "undone": "Non terminé"
};
static const Map<String,dynamic> en_US = {
  "to_do": "To Do",
  "doing": "Doing",
  "done": "Done",
  "history": "History",
  "item_title": "Item Title",
  "item_from": "Item From",
  "add_item": "Add Item",
  "summary": "Summary",
  "status": "Status",
  "start_date": "Start Date",
  "completed_date": "Completed Date",
  "total_time_spent": "Total Time Spent",
  "start": "Start",
  "stop": "Stop",
  "time_tracker": "Time Tracker",
  "all": "All",
  "undone": "Undone"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"fr_FR": fr_FR, "en_US": en_US};
}

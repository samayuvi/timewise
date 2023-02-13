import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

abstract class DocumentShare{
  Future<void> exportDocument(var listData);
  Future <void> share(File file);
}

class CsvDocumentShareImpl implements DocumentShare{
  @override
  Future<void> exportDocument(var listData) async {
    Directory tempDir = await getTemporaryDirectory();
    String filePath = '${tempDir.path}/board.csv';
    List<List<String>> rows = [];
    rows.add(['title', 'from', 'status']);
    for (var boardListObject in listData) {
      for (var task in boardListObject.items) {
        rows.add([boardListObject.title, task.from, task.columnName]);
      }
    }
    String csv = const ListToCsvConverter().convert(rows);
    File file = File(filePath);
    await file.writeAsString(csv);
    share(file);
  }

  @override
  Future<void> share(File file) async{
    await Share.shareFiles([file.path], text: 'Here is your CSV');
  }
}
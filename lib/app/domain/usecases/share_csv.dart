import 'package:time_wise/app/domain/repositories/doc_share.dart';

class ShareCSV{
  DocumentShare documentShare = CsvDocumentShareImpl();

  call(listData) async{
    await documentShare.exportDocument(listData);
  }
}
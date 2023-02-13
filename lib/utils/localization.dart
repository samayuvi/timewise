
import 'package:easy_localization/easy_localization.dart';
import 'package:time_wise/app/data/models/board_task_model.dart';
import 'package:time_wise/generated/locale_keys.g.dart';

class Localization{
  String convertTypesToLocal(String mainColumnName){
    if(MainColumnNames.todo == mainColumnName) {
      return LocaleKeys.to_do.tr();
    }
    if(MainColumnNames.doing == mainColumnName) {
      return LocaleKeys.doing.tr();
    }
    return LocaleKeys.done.tr();
  }
}
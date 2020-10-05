import 'package:mobx/mobx.dart';
part 'menuBusiness.g.dart';

class MenuStore = _MenuStoreBase with _$MenuStore;

abstract class _MenuStoreBase with Store {
  @observable
  String inputOne;

  @observable
  String inputTwo;
  
  @observable
  int inputId;

  @observable
  int precision;

  @action
  Future<String> parseText(DateTime datetime) async {
    if (precision == 1) {
      return '${datetime.year}';
    } else if (precision == 2) {
      return '${datetime.month.toString().padLeft(2, '0')}-${datetime.year}';
    } else if (precision == 3) {
      return '${datetime.day.toString().padLeft(2, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.year}';
    } else {
      return 'Invalid Format';
    }
  }

  @action
  String format() {
    if (precision == 1) {
      return 'yyyy';
    } else if (precision == 2) {
      return 'MM-yyyy';
    } else if (precision == 3) {
      return 'dd-MM-yyyy';
    } else {
      return 'dd-MM-yyyy';
    }
  }
}

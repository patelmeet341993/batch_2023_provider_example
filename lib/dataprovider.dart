import 'package:flutter/foundation.dart';

class DataProvider extends ChangeNotifier {
  int _msg = 0;

  int get msg => _msg;




  void increseCounter({bool isRefresh=true})
  {
    _msg++;
    if(isRefresh)notifyListeners();
  }

}

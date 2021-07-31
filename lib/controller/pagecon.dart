import 'package:flutter/cupertino.dart';
import 'package:skillshark/components/models.dart';

class Pagecontrol extends ChangeNotifier {
  int add = 0;
  int job = 0;
  int index = 0;
  Mproject project = p[0];
  double slider = 30;
  int playpause = 0;
  int getadd() {
    return add;
  }

  setadd(int a) {
    add = a;
    notifyListeners();
  }

  int getindex() {
    return index;
  }

  setindex(int a) {
    index = a;
    notifyListeners();
  }

  setj(int a) {
    job = a;
    notifyListeners();
  }

  setp(Mproject a) {
    project = a;
    notifyListeners();
  }

  setslider(double d) {
    slider = d;
    notifyListeners();
  }

  setplaypause(int i) {
    playpause = i;
    notifyListeners();
  }
}

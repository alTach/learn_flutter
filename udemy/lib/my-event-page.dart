import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<int>(context);
    return Text('${_value}-2222');
  }

}


class EventProvider {
  Stream<int> initStream() {
    Duration interval = Duration(seconds: 2);
    return Stream<int>.periodic(interval, (_count) => _count++);
  }
}
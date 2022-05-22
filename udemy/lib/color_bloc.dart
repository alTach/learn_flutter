import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { eventRed, eventGreen }

class ColorBloc extends Cubit<Color> {

  ColorBloc(Color initialState) : super(initialState);

  updateState(Color state) {
    emit(state);
  }

 // Color _color = Colors.red;
 // final _inputEventController = StreamController<ColorEvent>();
 //
 // StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;
 //
 // final _outputStateController = StreamController<Color>();
 // Stream<Color> get outputStateStream => _outputStateController.stream;
 //
 // void _mapEventToState(event) {
 //   if (event == ColorEvent.eventRed) {
 //     _color = Colors.red;
 //   } else if (event == ColorEvent.eventGreen) {
 //     _color = Colors.green;
 //   } else {
 //     throw Exception('Wrong event type');
 //   }
 //   _outputStateController.sink.add(_color);
 // }
 //
 // ColorBloc() {
 //   _inputEventController.stream.listen(_mapEventToState);
 // }
 //
 // void dispose() {
 //   _inputEventController.close();
 //   _outputStateController.close();
 // }
}
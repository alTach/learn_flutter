import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/color_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      home: BlocProvider(create: (_) => ColorBloc(Colors.red),
      child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Block with flutter block'),),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(builder: (context, color) => AnimatedContainer(
          height: 100,
          width: 100,
          color: color,
          duration: const Duration(milliseconds: 500),
        )),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            _bloc.updateState(Colors.red);
          }, backgroundColor: Colors.red,),
          SizedBox(width: 50),
          FloatingActionButton(onPressed: (){
            _bloc.updateState(Colors.green);
          }, backgroundColor: Colors.green,),
        ],
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _StudentPageState createState() => _StudentPageState();
// }
//
// class _StudentPageState extends State<HomePage> {
//   ColorBloc _bloc = ColorBloc();
//
//
//   @override
//   void dispose() {
//     super.dispose();
//     _bloc.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Block with stream'),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: StreamBuilder(
//           stream: _bloc.outputStateStream,
//           initialData: Colors.red,
//           builder: (context, AsyncSnapshot<Color> snapshot) {
//             return AnimatedContainer(
//               height: 100,
//               width: 100,
//               color: snapshot.data,
//               duration: const Duration(milliseconds: 500),
//             );
//           }
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(onPressed: (){
//             _bloc.inputEventSink.add(ColorEvent.eventRed);
//           }, backgroundColor: Colors.red,),
//           SizedBox(width: 50),
//           FloatingActionButton(onPressed: (){
//             _bloc.inputEventSink.add(ColorEvent.eventGreen);
//           }, backgroundColor: Colors.green,),
//         ],
//       ),
//     );
//   }
// }
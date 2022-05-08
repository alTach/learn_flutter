import 'package:flutter/material.dart';
import 'package:udemy/offices.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<OfficesList> officesList;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Scaffold(
          appBar: AppBar(
            title: Text(' Register Form'),
          ),
          body: Container(
            child: FutureBuilder<OfficesList>(
              future: officesList,
              builder: (context, snapshort) {
                if (snapshort.hasData) {
                  return ListView.builder(
                      itemCount: snapshort.data?.offices.length,
                      itemBuilder: (context , index) {
                        return Card(child: ListTile(
                          title: Text(snapshort.data?.offices[index].name ?? ''),
                          subtitle: Text(snapshort.data?.offices[index].address ?? ''),
                          leading: Image.network(snapshort.data?.offices[index].image ?? ''),
                          isThreeLine: true,
                        ),);
                      }
                  );
                } else  if(snapshort.hasError) {
                  return Text('Error');
                }
                return Center(child: CircularProgressIndicator(),);
              },
            ),
          ),
        ));
  }

  @override
  void initState() {
    officesList = getOfficeList();
  }
}
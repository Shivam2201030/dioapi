import 'package:dioapi/dataclass.dart';
import 'package:dioapi/todo.dart';
import 'package:flutter/material.dart';
import 'ApiCall.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dia Api Program',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Homepage(),
    );
  }
}
class Homepage extends StatelessWidget{
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('This is Dia Api Program'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Information>>(
        future: ApiManager().fetchData(),
        builder:
            (BuildContext context,AsyncSnapshot<List<Information>> snapshot){
          if(!snapshot.hasData){
            return const Center(
                child: CircularProgressIndicator());
           }
          else
            return Container(
                padding: const EdgeInsets.all(20),
                child: DataClass(datalist:snapshot.data as List<Information> ));
        },
      ),
    );
  }
}
// FutureBuilder is a powerful widget in Flutter that enables developers to handle asynchronous operations and update the UI accordingly.
// Snapshot, which is an AsyncSnapshot, holds the most recent interaction with the future, including data, error, and the state of the connection.
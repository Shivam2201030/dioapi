import 'package:dioapi/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DataClass extends StatelessWidget {
  const DataClass({Key? key, required this.datalist}) : super(key: key);
  final List<Information> datalist;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
            const SizedBox(height:10),
          Text(
            'Todo',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          FittedBox(
            child: DataTable(
              sortColumnIndex: 1,
              showBottomBorder: false,
              border: TableBorder.all(width: 1),
              columns: const [
                DataColumn(
                  label: Text('ID', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
                DataColumn(
                  label: Text('todo', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
                DataColumn(
                  label: Text('completed', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
                DataColumn(
                  label: Text('userID', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
              ],
              rows: datalist.map(
                    (data) => DataRow(
                  cells: [
                    DataCell(Text(data.id.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                  ),
                    DataCell(
                      Text(data.todo.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                    DataCell(Text(data.completed.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                    DataCell(Text(data.userId.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                  ],
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

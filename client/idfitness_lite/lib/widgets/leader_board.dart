import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "מצטיינים",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Table(
            textDirection: TextDirection.rtl,
            columnWidths: const {
              0: FlexColumnWidth(40),
              1: FlexColumnWidth(100),
              2: FlexColumnWidth(100),
            },
            children: [
              TableRow(children: [
                Column(children: const [Text('')]),
                Column(children: const [
                  Text(
                    'שם',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      height: 2,
                    ),
                  )
                ]),
                Column(children: const [
                  Text(
                    'ממוצע',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      height: 2,
                    ),
                  )
                ]),
              ]),
              const TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 2,
                      ),
                    ),
                  ),
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    Padding(padding: EdgeInsets.all(5)),
                    Padding(padding: EdgeInsets.all(5)),
                  ]),
              ...buildTableRows(),
            ],
          ),
        ),
      ],
    );
  }

  List<TableRow> buildTableRows() {
    List<TableRow> rows = [
      TableRow(children: [
        Column(children: [Text('.1')]),
        Column(children: [Text('name name')]),
        Column(children: [Text('avg')]),
      ]),
      TableRow(children: [
        Column(children: [Text('.2')]),
        Column(children: [Text('name name')]),
        Column(children: [Text('avg')]),
      ]),
      TableRow(children: [
        Column(children: [Text('.3')]),
        Column(children: [Text('name name')]),
        Column(children: [Text('avg')]),
      ]),
    ];
    return rows;
  }
}

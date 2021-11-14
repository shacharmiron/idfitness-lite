import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/soldiers_provider.dart';
import '../providers/results_provider.dart';
import '../entities/soldier.dart';
import '../entities/leader_board_row.dart';

class LeaderBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int leadersAmount = 3;
    List<Soldier> soldiers = Provider.of<SoldiersProvider>(context).soldiers;
    ResultsProvider results = Provider.of<ResultsProvider>(context);

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
          padding: const EdgeInsets.only(bottom: 15),
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
              ...buildTableRows(soldiers, results, leadersAmount),
            ],
          ),
        ),
      ],
    );
  }

  List<TableRow> buildTableRows(
    List<Soldier> soldiers,
    ResultsProvider results,
    int leadersAmount,
  ) {
    List<LeaderBoardRow> rows = [];
    for (Soldier soldier in soldiers) {
      rows.add(LeaderBoardRow(
        soldier: soldier,
        avg: results.getResultsAvg(results.getResultsOfSoldier(soldier.id)),
      ));
    }

    rows.sort((a, b) => a.avg - b.avg >= 0 ? -1 : 1);
    if (rows.length > leadersAmount) {
      rows = rows.sublist(0, leadersAmount);
    }

    List<TableRow> TableRows = [];

    const TextStyle tableRowTextStyle = TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);

    for (LeaderBoardRow row in rows) {
      TableRows.add(
        TableRow(children: [
          Column(children: [
            Text('.${(TableRows.length + 1).toString()}',
                style: tableRowTextStyle)
          ]),
          Column(children: [
            Text('${row.soldier.lastName} ${row.soldier.firstName}',
                style: tableRowTextStyle)
          ]),
          Column(children: [
            Text(row.avg.round().toString(), style: tableRowTextStyle)
          ]),
        ]),
      );
    }

    return TableRows;
  }
}

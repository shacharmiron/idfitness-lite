import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:idfitness_lite/entities/result.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../entities/event.dart';
import '../entities/avg_results_bar.dart';
import '../providers/events_provider.dart';
import '../providers/results_provider.dart';

class AvgResults extends StatelessWidget {
  bool firstTime = true;

  @override
  Widget build(BuildContext context) {
    const int passingResult = 60;
    List<AvgResultsBar> data = [];
    List<Event> lastEvents = Provider.of<EventsProvider>(context).lastEvents;
    ResultsProvider results = Provider.of<ResultsProvider>(context);

    for (var event in lastEvents) {
      List<Result> eventResults = results.getResultsOfEvent(event.id);
      int amount = eventResults.length;
      int sum = eventResults.fold(0, (previousValue, result) {
        return previousValue + result.result;
      });
      double avg = amount == 0 ? 0.1 : sum / amount;

      data.add(AvgResultsBar(
        eventDate: event.eventDate,
        eventName: event.eventType.name,
        avgResult: avg,
      ));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      const Text(
        "ציונים מוצעים",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: BarChart(
          BarChartData(
            barTouchData: buildBarTouchData(),
            gridData: FlGridData(show: false),
            maxY: 100,
            rangeAnnotations: buildPassingLine(passingResult),
            borderData: buildBorder(),
            titlesData: buildTitlesData(data),
            barGroups: buildBars(context, data),
          ),
        ),
      ),
    ]);
  }

  BarTouchData buildBarTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipMargin: 0,
        tooltipPadding: const EdgeInsets.all(0),
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            rod.y.round().toString(),
            const TextStyle(color: Colors.black),
          );
        },
      ),
    );
  }

  RangeAnnotations buildPassingLine(int passingResult) {
    return RangeAnnotations(horizontalRangeAnnotations: [
      HorizontalRangeAnnotation(
        y1: passingResult + 0,
        y2: passingResult - 1,
        color: const Color.fromRGBO(209, 172, 39, 1),
      ),
    ]);
  }

  FlBorderData buildBorder() {
    return FlBorderData(
      border: const Border(
        bottom: BorderSide(color: Colors.black, width: 2),
        left: BorderSide(color: Colors.black, width: 2),
      ),
    );
  }

  FlTitlesData buildTitlesData(List<AvgResultsBar> data) {
    return FlTitlesData(
      rightTitles: SideTitles(showTitles: false),
      leftTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        getTextStyles: (ctx, index) {
          return TextStyle(
            color: Theme.of(ctx).colorScheme.primary,
            fontSize: 12,
          );
        },
        getTitles: (index) {
          if (data.isNotEmpty) {
            return '${data[index.toInt()].eventName}\n${DateFormat('dd.MM.yy').format(data[index.toInt()].eventDate)}';
          } else {
            return '';
          }
        },
      ),
    );
  }

  List<BarChartGroupData> buildBars(
      BuildContext context, List<AvgResultsBar> data) {
    return List.generate(
      data.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            y: data[index].avgResult,
            width: 5,
            colors: [Theme.of(context).colorScheme.primary],
          ),
        ],
        showingTooltipIndicators: [0],
      ),
    );
  }
}

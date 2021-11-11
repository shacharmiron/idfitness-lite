import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../http_requests.dart' as http;
import '../entities/event.dart';
import '../providers/events_provider.dart';
import '../entities/avg_results_bar.dart';

class AvgResults extends StatefulWidget {
  bool firstTime = true;
  List<AvgResultsBar> data = [];

  @override
  State<AvgResults> createState() => _AvgResultsState();
}

class _AvgResultsState extends State<AvgResults> {
  @override
  Widget build(BuildContext context) {
    const int passingResult = 60;
    List<Event> lastEvents = Provider.of<EventsProvider>(context).lastEvents;
    if (widget.firstTime) {
      getAVGs(lastEvents).then((data) {
        if (data.isNotEmpty) {
          widget.firstTime = false;
        }
        setState(() {
          widget.data = data;
        });
      });
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
          borderRadius: BorderRadius.circular(12),
        ),
        child: BarChart(
          BarChartData(
            barTouchData: buildBarTouchData(),
            gridData: FlGridData(show: false),
            maxY: 100,
            rangeAnnotations: buildPassingLine(passingResult),
            borderData: buildBorder(),
            titlesData: buildTitlesData(widget.data),
            barGroups: buildBars(context, widget.data),
          ),
        ),
      ),
    ]);
  }

  Future<List<AvgResultsBar>> getAVGs(List<Event> lastEvents) async {
    double avg = 0;
    List<AvgResultsBar> chartBars = [];
    for (var event in lastEvents) {
      avg = 0;
      await http.findResultsByEvent(event.id).then((results) {
        if (results.isEmpty) {
          chartBars.add(AvgResultsBar(
            avgResult: 0.1,
            eventName: event.eventType.name,
            eventDate: event.eventDate,
          ));
        } else {
          double sum = results.fold(0, (previousValue, result) {
            return previousValue + result.result + 0.0;
          });

          avg = sum / results.length + 0.0;
          chartBars.add(AvgResultsBar(
            avgResult: avg,
            eventName: event.eventType.name,
            eventDate: event.eventDate,
          ));
        }
      });
    }
    return chartBars;
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

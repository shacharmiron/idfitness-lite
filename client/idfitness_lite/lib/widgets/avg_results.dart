import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AvgResults extends StatelessWidget {
  const AvgResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int passingResult = 60;
    List<double> data = [98, 70, 85.124, 40.1, 80.5];
    List<String> textData = [
      'אימון',
      'מבחן',
      'אימון2',
      'כוח',
      'ריצה',
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      const Text("ציונים מוצעים"),
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
            barTouchData: BarTouchData(
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
            ),
            gridData: FlGridData(show: false),
            maxY: 100,
            rangeAnnotations: RangeAnnotations(horizontalRangeAnnotations: [
              HorizontalRangeAnnotation(
                y1: passingResult + 1,
                y2: passingResult - 1,
                color: const Color.fromRGBO(209, 172, 39, 1),
              ),
            ]),
            borderData: FlBorderData(
              border: const Border(
                bottom: BorderSide(color: Colors.black, width: 2),
                left: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            titlesData: FlTitlesData(
              rightTitles: SideTitles(showTitles: false),
              leftTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (ctx, index) {
                  return TextStyle(
                    color: Theme.of(ctx).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  );
                },
                getTitles: (index) {
                  return '${textData[index.toInt()]}\n10.5.21';
                },
              ),
            ),
            barGroups: List.generate(
              data.length,
              (index) => BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    y: data[index],
                    width: 5,
                    colors: [Theme.of(context).colorScheme.primary],
                  ),
                ],
                showingTooltipIndicators: [0],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

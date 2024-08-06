import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final String x;
  final double y;
  final Color? color;

  ChartData(this.x, this.y, [this.color]);
}

class PieChartWidget extends StatelessWidget {
  final List<ChartData> chartData;

  const PieChartWidget({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCircularChart(
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  labelPosition: ChartDataLabelPosition.outside,
                ),
                dataLabelMapper: (ChartData data, _) => '${data.x}: ${data.y}%',
                explode: true,
                explodeIndex: 0,
                radius: '90%',
              ),
            ],
          ),
        ),
        _buildLegend(),
      ],
    );
  }

  Widget _buildLegend() {
    return Column(
      children: chartData.map((data) {
        return LegendItem(
            color: data.color!, label: data.x, percentage: '${data.y}%');
      }).toList(),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String percentage;

  const LegendItem({
    super.key,
    required this.color,
    required this.label,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(label,
                style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
          Text(percentage,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}

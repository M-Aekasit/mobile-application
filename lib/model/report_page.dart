import 'package:flutter/material.dart';
import 'widget/pie_chart.dart';
import 'bottom_nav_bar.dart';
import 'drawer_widget.dart'; // Import AppDrawer

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final List<ChartData> chartData = [
    ChartData('โฟมแตก', 40, Colors.orange),
    ChartData('จับ/ยับย่น', 11, Colors.pink),
    ChartData('ล่อน', 11, Colors.purple),
    ChartData('โฟมเหว่ง', 10, Colors.blue),
    ChartData('SET GAP', 8, Colors.green),
  ];

  DateTime? startDate;
  DateTime? endDate;
  String? selectedLine;
  String? selectedMachine;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A2C2D),
        centerTitle: true,
        title: const Text(
          'Report',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono',
          ),
        ),
      ),
      drawer: const AppDrawer(), // Add the drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Plant A /', style: TextStyle(color: Colors.white)),
                Text('13-Jun-24   12:37',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateButton('Start Date', startDate, true),
                _buildDateButton('End Date', endDate, false),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(
                    'Select Line', selectedLine, ['Line 1', 'Line 2', 'Line 3'],
                    (String? newValue) {
                  setState(() {
                    selectedLine = newValue;
                  });
                }),
                _buildDropdown('Select Machine', selectedMachine, [
                  'Machine 1',
                  'Machine 2',
                  'Machine 3'
                ], (String? newValue) {
                  setState(() {
                    selectedMachine = newValue;
                  });
                }),
              ],
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'NG reason',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(child: PieChartWidget(chartData: chartData)),
            _buildSeeMoreButton(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Set the current index to the appropriate value
        onTap: (index) => handleNavigation(context, index),
      ),
    );
  }

  Widget _buildDateButton(String label, DateTime? date, bool isStartDate) {
    return ElevatedButton(
      onPressed: () => _selectDate(context, isStartDate),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        date == null ? label : '${date.day}-${date.month}-${date.year}',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  DropdownButton<String> _buildDropdown(String hint, String? selectedValue,
      List<String> items, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      dropdownColor: Colors.black,
      hint: Text(hint, style: const TextStyle(color: Colors.white)),
      value: selectedValue,
      style: const TextStyle(
          color: Colors.white), // Add this line to set the text color
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: const TextStyle(
                  color: Colors
                      .white)), // Add this line to set the text color in the dropdown
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildSeeMoreButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: TextButton(
          onPressed: () {
            // Handle See more action
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DetailedReportPage()),
            );
          },
          child: const Text(
            'See more...',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}

class DetailedReportPage extends StatelessWidget {
  const DetailedReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with the detailed report content
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Report'),
      ),
      body: const Center(
        child: Text('Detailed report content goes here'),
      ),
    );
  }
}

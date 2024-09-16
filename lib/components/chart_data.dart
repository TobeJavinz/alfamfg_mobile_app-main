// chart_data.dart

class ChartColumnData {
  ChartColumnData(this.x, this.y);
  final String x;
  final double? y;
}

// Example data for each date
Map<DateTime, List<ChartColumnData>> dataByDate = {
  DateTime(2024, 7, 1): [
    ChartColumnData('Product 1', 45),
    ChartColumnData('Product 2', 20),
    ChartColumnData('Product 3', 35),
    ChartColumnData('Product 4', 50),
  ],
  DateTime(2024, 7, 2): [
    ChartColumnData('Product 1', 30),
    ChartColumnData('Product 2', 25),
    ChartColumnData('Product 3', 40),
    ChartColumnData('Product 4', 10),
  ],
  DateTime(2024, 7, 3): [
    ChartColumnData('Product 1', 35),
    ChartColumnData('Product 2', 40),
    ChartColumnData('Product 3', 20),
    ChartColumnData('Product 4', 30),
  ],
  DateTime(2024, 7, 4): [
    ChartColumnData('Product 1', 50),
    ChartColumnData('Product 2', 30),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 45),
  ],
  DateTime(2024, 7, 5): [
    ChartColumnData('Product 1', 20),
    ChartColumnData('Product 2', 35),
    ChartColumnData('Product 3', 40),
    ChartColumnData('Product 4', 15),
  ],
  DateTime(2024, 7, 6): [
    ChartColumnData('Product 1', 25),
    ChartColumnData('Product 2', 45),
    ChartColumnData('Product 3', 30),
    ChartColumnData('Product 4', 35),
  ],
  DateTime(2024, 7, 7): [
    ChartColumnData('Product 1', 40),
    ChartColumnData('Product 2', 20),
    ChartColumnData('Product 3', 45),
    ChartColumnData('Product 4', 25),
  ],
  DateTime(2024, 7, 8): [
    ChartColumnData('Product 1', 35),
    ChartColumnData('Product 2', 25),
    ChartColumnData('Product 3', 40),
    ChartColumnData('Product 4', 30),
  ],
  DateTime(2024, 7, 9): [
    ChartColumnData('Product 1', 30),
    ChartColumnData('Product 2', 40),
    ChartColumnData('Product 3', 20),
    ChartColumnData('Product 4', 50),
  ],
  DateTime(2024, 7, 10): [
    ChartColumnData('Product 1', 45),
    ChartColumnData('Product 2', 30),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 35),
  ],
  DateTime(2024, 7, 11): [
    ChartColumnData('Product 1', 20),
    ChartColumnData('Product 2', 35),
    ChartColumnData('Product 3', 45),
    ChartColumnData('Product 4', 40),
  ],
  DateTime(2024, 7, 12): [
    ChartColumnData('Product 1', 50),
    ChartColumnData('Product 2', 25),
    ChartColumnData('Product 3', 30),
    ChartColumnData('Product 4', 20),
  ],
  DateTime(2024, 7, 13): [
    ChartColumnData('Product 1', 30),
    ChartColumnData('Product 2', 20),
    ChartColumnData('Product 3', 35),
    ChartColumnData('Product 4', 40),
  ],
  DateTime(2024, 7, 14): [
    ChartColumnData('Product 1', 25),
    ChartColumnData('Product 2', 45),
    ChartColumnData('Product 3', 50),
    ChartColumnData('Product 4', 35),
  ],
  DateTime(2024, 7, 15): [
    ChartColumnData('Product 1', 40),
    ChartColumnData('Product 2', 30),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 45),
  ],
  DateTime(2024, 7, 16): [
    ChartColumnData('Product 1', 35),
    ChartColumnData('Product 2', 40),
    ChartColumnData('Product 3', 20),
    ChartColumnData('Product 4', 50),
  ],
  DateTime(2024, 7, 17): [
    ChartColumnData('Product 1', 50),
    ChartColumnData('Product 2', 25),
    ChartColumnData('Product 3', 30),
    ChartColumnData('Product 4', 35),
  ],
  DateTime(2024, 7, 18): [
    ChartColumnData('Product 1', 20),
    ChartColumnData('Product 2', 35),
    ChartColumnData('Product 3', 45),
    ChartColumnData('Product 4', 40),
  ],
  DateTime(2024, 7, 19): [
    ChartColumnData('Product 1', 30),
    ChartColumnData('Product 2', 50),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 35),
  ],
  DateTime(2024, 7, 20): [
    ChartColumnData('Product 1', 45),
    ChartColumnData('Product 2', 40),
    ChartColumnData('Product 3', 20),
    ChartColumnData('Product 4', 50),
  ],
  DateTime(2024, 7, 21): [
    ChartColumnData('Product 1', 35),
    ChartColumnData('Product 2', 30),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 45),
  ],
  DateTime(2024, 7, 22): [
    ChartColumnData('Product 1', 40),
    ChartColumnData('Product 2', 25),
    ChartColumnData('Product 3', 30),
    ChartColumnData('Product 4', 20),
  ],
  DateTime(2024, 7, 23): [
    ChartColumnData('Product 1', 25),
    ChartColumnData('Product 2', 50),
    ChartColumnData('Product 3', 35),
    ChartColumnData('Product 4', 45),
  ],
  DateTime(2024, 7, 24): [
    ChartColumnData('Product 1', 50),
    ChartColumnData('Product 2', 30),
    ChartColumnData('Product 3', 20),
    ChartColumnData('Product 4', 40),
  ],
  DateTime(2024, 7, 25): [
    ChartColumnData('Product 1', 45),
    ChartColumnData('Product 2', 35),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 30),
  ],
  DateTime(2024, 7, 26): [
    ChartColumnData('Product 1', 30),
    ChartColumnData('Product 2', 20),
    ChartColumnData('Product 3', 50),
    ChartColumnData('Product 4', 45),
  ],
  DateTime(2024, 7, 27): [
    ChartColumnData('Product 1', 25),
    ChartColumnData('Product 2', 45),
    ChartColumnData('Product 3', 40),
    ChartColumnData('Product 4', 35),
  ],
  DateTime(2024, 7, 28): [
    ChartColumnData('Product 1', 35),
    ChartColumnData('Product 2', 30),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 50),
  ],
  DateTime(2024, 7, 29): [
    ChartColumnData('Product 1', 50),
    ChartColumnData('Product 2', 20),
    ChartColumnData('Product 3', 30),
    ChartColumnData('Product 4', 45),
  ],
  DateTime(2024, 7, 30): [
    ChartColumnData('Product 1', 45),
    ChartColumnData('Product 2', 25),
    ChartColumnData('Product 3', 35),
    ChartColumnData('Product 4', 40),
  ],
  DateTime(2024, 7, 31): [
    ChartColumnData('Product 1', 20),
    ChartColumnData('Product 2', 50),
    ChartColumnData('Product 3', 45),
    ChartColumnData('Product 4', 30),
  ],
  DateTime(2024, 8, 1): [
    ChartColumnData('Product 1', 50),
    ChartColumnData('Product 2', 25),
    ChartColumnData('Product 3', 30),
    ChartColumnData('Product 4', 40),
  ],
  DateTime(2024, 8, 2): [
    ChartColumnData('Product 1', 35),
    ChartColumnData('Product 2', 40),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 45),
  ],
  DateTime(2024, 8, 3): [
    ChartColumnData('Product 1', 30),
    ChartColumnData('Product 2', 20),
    ChartColumnData('Product 3', 50),
    ChartColumnData('Product 4', 35),
  ],
  DateTime(2024, 8, 4): [
    ChartColumnData('Product 1', 45),
    ChartColumnData('Product 2', 30),
    ChartColumnData('Product 3', 25),
    ChartColumnData('Product 4', 40),
  ],
  DateTime(2024, 8, 5): [
    ChartColumnData('Product 1', 50),
    ChartColumnData('Product 2', 35),
    ChartColumnData('Product 3', 20),
    ChartColumnData('Product 4', 30),
  ],
  DateTime(2024, 8, 6): [
    ChartColumnData('Product 1', 40),
    ChartColumnData('Product 2', 25),
    ChartColumnData('Product 3', 30),
    ChartColumnData('Product 4', 50),
  ],
  // Add data for other dates...
};

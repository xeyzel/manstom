import 'package:flutter_test/flutter_test.dart';

void main() {
  test('date', () {
    final dateString = '2023-06-14T02:16:14.679775';
    final date = DateTime.now().toIso8601String();
    final parseDate = DateTime.parse(dateString);
    print(parseDate);
  });
}

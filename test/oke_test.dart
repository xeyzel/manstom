import 'package:flutter_test/flutter_test.dart';

String provider(String uang) {
  return uang;
}

String repository(String uang) {
  return uang;
}

insertOne(warehouse) {}

void bloc(String uang) {
  print(uang);
}

void main() {
  test(
    'tree context',
    () {
      final uangAyah = provider('10000');
      final uangKaka = repository(uangAyah);
      bloc(uangKaka);
    },
  );
}

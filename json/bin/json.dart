// bin/json.dart
import 'dart:convert';

import 'package:json/json.dart' as json;

void main() {
// final json = '{"productName":"Suit", "brand": "Armani"}';
// final parseJson = jsonDecode(json);
// print('${parseJson.runtimeType} : $parseJson');

  final json = '''
  [
    {"productName":"Suit", "brand":"Armani"},
    {"productName":"Shoes", "brand":"Nike"},
    {"productName":"Watch", "brand":"Rolex"}
  ]
  ''';

  final parseJson = jsonDecode(json);

  print('${parseJson.runtimeType} : $parseJson');

  // Loop through records
  for (var item in parseJson) {
    print('Product: ${item['productName']}, Brand: ${item['brand']}');
  }
}



import 'dart:core';
import 'dart:math';

const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';

String generatedCode = '';

String randomCode() {
  Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
  String result = "";

  for (var i = 0; i < 4; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  generatedCode = result;
  return result;
}

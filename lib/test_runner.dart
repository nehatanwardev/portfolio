import 'dart:io';
import 'test3.dart';

void main() {
  // Read test cases from file
  final file = File('test-input.txt');
  final lines = file.readAsLinesSync();

  int testCaseNumber = 0;
  int line = 0;

  while (line < lines.length) {
    // Skip comments and empty lines
    if (lines[line].trim().isEmpty || lines[line].trim().startsWith('#')) {
      line++;
      continue;
    }

    // Parse test case
    final arrayStr = lines[line++].trim();
    if (line >= lines.length) break;

    final dispensersStr = lines[line++].trim();
    if (dispensersStr.isEmpty) continue;

    // Parse array
    List<int> A = [];
    if (arrayStr.startsWith('[') && arrayStr.endsWith(']')) {
      final content = arrayStr.substring(1, arrayStr.length - 1);
      if (content.isNotEmpty) {
        A = content.split(',').map((s) => int.parse(s.trim())).toList();
      }
    }

    // Parse dispensers
    final dispensers =
        dispensersStr.split(' ').map((s) => int.parse(s.trim())).toList();
    if (dispensers.length != 3) continue;

    final X = dispensers[0];
    final Y = dispensers[1];
    final Z = dispensers[2];

    // Run test
    testCaseNumber++;
    final result = solution(A, X, Y, Z);
    print('Test Case $testCaseNumber: ${result}');
  }
}

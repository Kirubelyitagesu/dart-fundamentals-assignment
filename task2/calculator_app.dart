// Task 2: Async Calculator App
// Name: Kirubel Yitagesu

import 'dart:async';

/// Custom exception for invalid operations
class InvalidOperationException implements Exception {
  final String message;
  InvalidOperationException(this.message);
  @override
  String toString() => message;
}

class Calculator {
  final String name;

  // History log to store completed calculations
  final List<String> history = [];

  Calculator(this.name);

  // --------------------------
  // Synchronous arithmetic methods
  // --------------------------
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;

  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }

  // --------------------------
  // Asynchronous computation
  // --------------------------
  Future<double> computeAsync(double a, double b, String op) async {
    double result;

    switch (op) {
      case 'add':
        result = add(a, b);
        break;
      case 'subtract':
        result = subtract(a, b);
        break;
      case 'multiply':
        result = multiply(a, b);
        break;
      case 'divide':
        result = divide(a, b);
        break;
      default:
        throw InvalidOperationException('Unknown operation: $op');
    }

    // Simulate delay of 1.5 seconds
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));

    // Record successful calculation in history
    history.add('$op($a, $b) = $result');

    return result;
  }

  // --------------------------
  // Display the result with clean error messages
  // --------------------------
  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op);
      print('$op($a, $b) = $result');
    } on ArgumentError catch (e) {
      print('Error: ${e.message}');
    } on InvalidOperationException catch (e) {
      print('Error: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  // --------------------------
  // Bonus: Print calculation history
  // --------------------------
  void printHistory() {
    print('\n--- Calculation History ---');
    if (history.isEmpty) {
      print('No calculations performed yet.');
      return;
    }
    for (var entry in history) {
      print(entry);
    }
  }

  // --------------------------
  // Bonus: Compute chained operations
  // --------------------------
  Future<double> computeChained(List<double> values, String op) async {
    if (values.isEmpty) {
      throw ArgumentError('Cannot compute on an empty list.');
    }

    double result = values[0];

    for (int i = 1; i < values.length; i++) {
      switch (op) {
        case 'add':
          result = add(result, values[i]);
          break;
        case 'subtract':
          result = subtract(result, values[i]);
          break;
        case 'multiply':
          result = multiply(result, values[i]);
          break;
        case 'divide':
          result = divide(result, values[i]);
          break;
        default:
          throw InvalidOperationException('Unknown operation: $op');
      }

      await Future.delayed(const Duration(milliseconds: 500));
    }

    history.add('$op(${values.join(', ')}) = $result');
    return result;
  }
}

Future<void> main() async {
  final calc = Calculator('MyCalculator');

  print('--- ${calc.name} ---');

  // Sequential asynchronous calls
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  await calc.displayResult(10, 4, 'divide');
  await calc.displayResult(15, 3, 'divide');
  await calc.displayResult(10, 0, 'divide'); // Divide by zero test
  await calc.displayResult(5, 2, 'mod'); // Unknown operation test

  // Bonus: Chained operations
  double chainResult = await calc.computeChained([1, 2, 3, 4], 'add');
  print('Chained add result: $chainResult');

  // Bonus: Print history
  calc.printHistory();

  // Bonus: Run multiple calculations in parallel
  print('\n--- Running parallel calculations ---');
  List<Future<void>> parallelFutures = [
    calc.displayResult(2, 3, 'add'),
    calc.displayResult(4, 5, 'multiply'),
    calc.displayResult(10, 2, 'divide'),
    calc.displayResult(7, 1, 'subtract'),
  ];

  await Future.wait(parallelFutures);
  print('All calculations complete.');
}

import 'dart:async';
import 'dart:isolate';

// Do not modify.
class IsolateData<T> {
  final Future<T> Function(T) functionToRun;
  final T dataToProcess;
  final SendPort sendPort;

  IsolateData(this.functionToRun, this.dataToProcess, this.sendPort);
}

// Do not modify.
Future<(Isolate, ReceivePort)> runInIsolate<T>(
  Future<T> Function(T) functionToRun,
  T dataToProcess,
) async {
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn(
    isolateFunction<T>,
    IsolateData(functionToRun, dataToProcess, receivePort.sendPort),
  );

  return (isolate, receivePort);
}

// Start your solutions here:
void isolateFunction<T>(IsolateData<T> isolateData) async {
  try {
    // Execute the function with the provided data
    final result = await isolateData.functionToRun(isolateData.dataToProcess);

    // Send the result back through the SendPort
    isolateData.sendPort.send(result);
  } catch (e) {
    // Send the error back if an exception occurs
    isolateData.sendPort.send(e);
  } finally {
    // Ensure the isolate is terminated after execution
    Isolate.exit();
  }
}

class DataProcessor {
  /// Processes large data by running each function in parallel with its corresponding data item.
  ///
  /// Returns a list of ReceivePorts to get the results.
  /// Throws an AssertionError if the lengths of functions and data lists are not equal.
  Future<List<ReceivePort>> processLargeData<T>(
    List<Future<T> Function(T)> functions,
    List<T> data,
  ) async {
    // Validate that functions and data lists have the same length
    if (functions.length != data.length) {
      throw AssertionError(
          'Functions and data lists must have the same length');
    }

    // Handle empty lists case
    if (functions.isEmpty) {
      return [];
    }

    final List<ReceivePort> receivePorts = [];

    // Process each function with its corresponding data in parallel
    for (int i = 0; i < functions.length; i++) {
      final (_, receivePort) = await runInIsolate(functions[i], data[i]);
      receivePorts.add(receivePort);
    }

    return receivePorts;
  }

  /// Chains computation by executing functions sequentially, using the output of one function
  /// as the input to the next function.
  ///
  /// Returns the final result and a list of ReceivePorts used.
  Future<(T, List<ReceivePort>)> chainComputation<T>(
    List<Future<T> Function(T)> functions,
    T initialData,
  ) async {
    // Handle empty functions list
    if (functions.isEmpty) {
      return (initialData, <ReceivePort>[]);
    }

    T currentData = initialData;
    final List<ReceivePort> receivePorts = [];

    // Execute functions sequentially
    for (final function in functions) {
      final (_, receivePort) = await runInIsolate(function, currentData);
      receivePorts.add(receivePort);

      // Wait for the result from the isolate
      final completer = Completer<T>();
      receivePort.listen((message) {
        if (message is Exception) {
          completer.completeError(message);
        } else {
          completer.complete(message as T);
        }
      });

      // Update currentData with the result for the next function
      currentData = await completer.future;
    }

    return (currentData, receivePorts);
  }

  /// Runs a single function on multiple data points in parallel.
  ///
  /// Returns a list of results and a list of ReceivePorts used.
  Future<(List<T>, List<ReceivePort>)> parallelizeComputation<T>(
    Future<T> Function(T) function,
    List<T> data,
  ) async {
    // Handle empty data list
    if (data.isEmpty) {
      return (<T>[], <ReceivePort>[]);
    }

    final List<ReceivePort> receivePorts = [];
    final List<Completer<T>> completers = [];

    // Process each data item with the same function in parallel
    for (final item in data) {
      final (_, receivePort) = await runInIsolate(function, item);
      receivePorts.add(receivePort);

      final completer = Completer<T>();
      completers.add(completer);

      receivePort.listen((message) {
        if (message is Exception) {
          completer.completeError(message);
        } else {
          completer.complete(message as T);
        }
      });
    }

    // Wait for all results
    final results = await Future.wait(completers.map((c) => c.future));

    return (results, receivePorts);
  }
}

// Example usage
void main() async {
  final dp = DataProcessor();

  // Example 1: Process large data
  print('Example 1: Process large data');
  final receivePorts = await dp.processLargeData<int>(
    [
      (int n) async => n + 1,
      (int n) async => n + 1,
      (int n) async => n + 1,
    ],
    [1, 2, 3],
  );

  final results1 = await Future.wait(
      receivePorts.map((port) => port.first.then((value) => value as int)));
  print(results1); // Should print [2, 3, 4]

  // Example 2: Chain computation
  print('\nExample 2: Chain computation');
  final (result, _) = await dp.chainComputation<int>(
    [
      (int n) async => n + 1,
      (int n) async => n * 2,
      (int n) async => n + 3,
    ],
    1,
  );
  print(result); // Should print 7

  // Example 3: Parallelize computation
  print('\nExample 3: Parallelize computation');
  final (results3, _) = await dp.parallelizeComputation<int>(
    (int n) async => n * 2,
    [1, 2, 3],
  );
  print(results3); // Should print [2, 4, 6]

  // Example 4: Exception handling
  print('\nExample 4: Exception handling');
  try {
    await dp.processLargeData<int>(
      [(int n) async => n + 1],
      [1, 2],
    );
  } catch (e) {
    print("Functions and data lists must have the same length");
  }
}

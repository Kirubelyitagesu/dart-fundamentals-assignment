// Task 1: Number Analysis App
// Name: Kirubel Yitagesu

/// Returns the largest value in the list.
int findMax(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error: The list is empty. Cannot find maximum.");
    return 0;
  }

  int max = numbers[0];

  for (int number in numbers) {
    if (number > max) {
      max = number;
    }
  }

  return max;
}

/// Returns the smallest value in the list.
int findMin(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error: The list is empty. Cannot find minimum.");
    return 0;
  }

  int min = numbers[0];

  for (int number in numbers) {
    if (number < min) {
      min = number;
    }
  }

  return min;
}

/// Calculates the sum of all numbers.
int calculateSum(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error: The list is empty. Sum is 0.");
    return 0;
  }

  int total = 0;

  for (int number in numbers) {
    total += number;
  }

  return total;
}

/// Calculates the average value.
double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error: The list is empty. Average is 0.");
    return 0.0;
  }

  int total = calculateSum(numbers);

  return total / numbers.length;
}

/// Counts how many numbers are negative.
int countNegatives(List<int> numbers) {
  int count = 0;

  for (int number in numbers) {
    if (number < 0) {
      count++;
    }
  }

  return count;
}

/// Returns a new sorted list using bubble sort.
List<int> sortNumbers(List<int> numbers) {
  List<int> sorted = List.from(numbers);

  for (int i = 0; i < sorted.length; i++) {
    for (int j = 0; j < sorted.length - 1; j++) {
      if (sorted[j] > sorted[j + 1]) {
        int temp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = temp;
      }
    }
  }

  return sorted;
}

void main() {
  final List<int> numbers = [34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  int maxValue = findMax(numbers);
  int minValue = findMin(numbers);
  int sum = calculateSum(numbers);
  double average = calculateAverage(numbers);
  int negativeCount = countNegatives(numbers);

  List<int> sortedNumbers = sortNumbers(numbers);

  print('Number Analysis Results');
  print('========================');
  print('Numbers: $numbers');
  print('Maximum value : $maxValue');
  print('Minimum value : $minValue');
  print('Sum           : $sum');
  print('Average       : $average');
  print('Negative nums : $negativeCount');
  print('Sorted list   : $sortedNumbers');
}

// Task 1: Number Analysis App
// Name: Kirubel Yitagesu

/// Returns the largest value in the list of integers.
/// The function iterates through the list and keeps
/// track of the maximum value found so far.
int findMax(List<int> numbers) {
  int max = numbers[0];

  for (int number in numbers) {
    if (number > max) {
      max = number;
    }
  }

  return max;
}

/// Returns the smallest value in the list of integers.
/// The function compares each number and updates the
/// minimum value when a smaller number is found.
int findMin(List<int> numbers) {
  int min = numbers[0];

  for (int number in numbers) {
    if (number < min) {
      min = number;
    }
  }

  return min;
}

/// Calculates the total sum of all integers in the list
/// using an accumulator variable.
int calculateSum(List<int> numbers) {
  int total = 0;

  for (int number in numbers) {
    total += number;
  }

  return total;
}

/// Calculates the average value of the list.
/// This function calls calculateSum() and divides
/// the result by the number of elements.
double calculateAverage(List<int> numbers) {
  int total = calculateSum(numbers);

  return total / numbers.length;
}

void main() {
  final List<int> numbers = [34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  int maxValue = findMax(numbers);
  int minValue = findMin(numbers);
  int sum = calculateSum(numbers);
  double average = calculateAverage(numbers);

  print('Number Analysis Results');
  print('========================');
  print('Numbers: $numbers');
  print('Maximum value : $maxValue');
  print('Minimum value : $minValue');
  print('Sum           : $sum');
  print('Average       : $average');
}

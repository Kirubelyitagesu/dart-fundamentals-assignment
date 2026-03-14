Q1. What is the difference between a List<int> and a List<dynamic> in Dart? Why is it usually better to use a typed list like List<int>?

A List<int> means that the list is only allowed to store integers. The Dart compiler knows the type of data inside the list, so it can help catch mistakes early if we try to insert something that is not an integer. A List<dynamic> on the other hand can store any type of value such as integers, strings, or objects. While this is more flexible, it is also less safe because type errors might only appear while the program is running. Using a typed list like List<int> makes the code safer, easier to understand, and helps the compiler detect errors earlier.

Q2. In your findMax() function, why is it important to initialize your “running maximum” variable to the first element of the list rather than to 0 or to a very small number? What could go wrong with the other approaches?

Initializing the running maximum to the first element ensures that the comparison starts with a real value from the list. If we initialized it to 0, the function would give incorrect results when the list contains only negative numbers, because 0 would always appear larger than the actual values. Using a very small number is also risky because we would have to guess a value that is guaranteed to be smaller than any number in the list. By using the first element, we avoid these problems and ensure that the algorithm works correctly for any list of numbers.

Q3. Your calculateAverage() function calls calculateSum() internally. What software design principle does this demonstrate, and why is reusing existing functions preferable to duplicating code?

This demonstrates the idea of code reuse and modular programming. Instead of writing the logic for calculating the sum again, the function simply calls the already existing calculateSum() function. Reusing code is better because it keeps programs shorter, easier to maintain, and less likely to contain bugs. If the sum logic ever needs to change, it only needs to be updated in one place rather than in multiple parts of the program.

Q4. Describe in plain English what the for-in loop syntax does in Dart. How is it different from a traditional for loop with an index? When would you prefer one over the other?

A for-in loop goes through each element in a collection one by one. Instead of using an index to access elements, it directly gives you the value of each item in the list. A traditional for loop uses an index variable (like i) to access elements by their position in the list. The for-in loop is usually simpler and easier to read when you only need the values. A traditional for loop is more useful when you need the index number or when you need more control over how the loop runs.

Q5. If someone calls your findMax() function with an empty list, what happens? How could you modify the function to handle that case safely?

If findMax() is called with an empty list, the program will crash because it tries to access numbers[0], which does not exist. This causes a runtime error. To prevent this, the function can check if the list is empty before doing any calculations. If it is empty, the function can print an error message and return a default value such as 0. This makes the function safer and prevents the program from crashing.

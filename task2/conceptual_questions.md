Q6. What is the difference between a synchronous function and an asynchronous function in Dart? 
In your Calculator class, why is divide() synchronous while computeAsync() is asynchronous?

A synchronous function runs immediately and completes its work before moving to the next line of code. An asynchronous function, on the other hand, may take some time to complete (like waiting for data from a server) and allows the program to continue running while waiting. 
In the Calculator class, divide() is synchronous because the actual division calculation is very fast and doesn’t need to wait. computeAsync() is asynchronous because it simulates a delay to mimic a network or time-consuming operation, showing how async/await works.

Q7. Explain the purpose of the await keyword in Dart. 
What happens if you forget to use await when calling an async function that returns a Future? 
What does your program print instead of the result?

The await keyword tells Dart to pause execution until the asynchronous operation completes and returns a result. 
If you forget to use await, Dart will not wait for the operation to finish and will instead return a Future object immediately. 
In our program, if we forget await when calling computeAsync(), it would print something like "Instance of 'Future<double>'" instead of the actual calculation result.

Q8. What is the purpose of the try-catch block in your displayResult() method? 
What would happen if you removed it and then called displayResult(10, 0, 'divide')?

The try-catch block is used to catch and handle errors or exceptions that may occur during execution. In displayResult(), it catches errors like dividing by zero or unknown operations and prints a friendly message instead of crashing the program. 
If we removed the try-catch block and called displayResult(10, 0, 'divide'), the program would throw an unhandled ArgumentError and stop running, which is not user-friendly.

Q9. Why is it good design to have divide() throw an ArgumentError rather than simply returning 0 or printing an error inside the divide() method itself? 
What principle of function design does this reflect?

Throwing an ArgumentError allows the caller of the function to decide how to handle the error instead of the function deciding for them. This keeps the function focused on a single task (performing division) and makes it more predictable and reusable. 
This reflects the principle of separation of concerns and clear function design: a function should either do its job correctly or signal an error to be handled elsewhere.

Q10. What does the async keyword on main() allow you to do? 
Could this assignment have been written without making main() async? Explain your answer.

The async keyword on main() allows the use of await inside main(), which means we can wait for asynchronous operations like computeAsync() to finish before moving on. 
Technically, we could write this assignment without making main() async, but then we would have to use then() callbacks to handle Futures, which is more complex and harder to read. Using async/await makes the code simpler and easier to follow.



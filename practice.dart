// import 'dart:io';

// void main() {
//   print('Enter a number');
//   int? number = int.tryParse(stdin.readLineSync()!);
//   if (number! % 2 == 0) {
//     print('Even number');
//   } else {
//     print('Odd number');
//   }
// }
// void main(List<String> args) {
//   List<int> numbers = [1, 2, 3, 4, 5];
//   int largest = numbers[0];
//   for (var num in numbers) {
//     if (num < largest) {
//       largest = num;
//     }
//   }
//   print('Largest number is $largest');
// }

//...recerse a string using for loop...
// void main(List<String> args) {
//   String str = 'Hello, Dart!';
//   String reversedStr = '';
//   for (int i = str.length - 1; i >= 0; i--) {
//     reversedStr += str[i];
//   }
//   print('Reversed string: $reversedStr');
// }

// void main(List<String> args) {
//   String str = 'Hassan Ali';
//   int count = 0;
//   for (int i = 0; i < str.length; i++) {
//     String char = str[i].toLowerCase();
//     if (char == 'a' ||
//         char == 'e' ||
//         char == 'i' ||
//         char == 'o' ||
//         char == 'u') {
//       count++;
//     }
//   }
//   print('Number of vowels in the string: $count');
// }

// void main(List<String> args) {
//   int factorial(int n) {
//     if (n <= 1) {
//       return 1;
//     } else {
//       return n * factorial(n - 1);
//     }
//   }

//   int n = 5;
//   int result = factorial(n);
//   print('Factorial of $n is $result');
// }

// void main() {
//   int n = 5;
//   int factorial = 1;

//   for (int i = 1; i <= n; i++) {
//     factorial *= i;
//   }

//   print('Factorial of $n is $factorial');
// }

// void main(List<String> args) {
//   List<int> num = [1, 2, 3, 3, 4, 4, 5];
//   List<int> uniqueNum = [];
//   for (int i = 0; i < num.length; i++) {
//     if (!uniqueNum.contains(num[i])) {
//       uniqueNum.add(num[i]);
//     }
//   }
//   print('Unique numbers: $uniqueNum');
// }

// void main(List<String> args) {
//   Map<String, int> Scores = {'Bio': 85, 'English': 92, 'Math': 78, 'Urdu': 90};
//   int totalScore = 0;
//   for (var score in Scores.values) {
//     totalScore += score;
//     print('Score: $score');
//   }
//   double averageScore = totalScore / Scores.length;
//   print('Average score: $averageScore');
// }

// void main(List<String> args) {
//   int a = 5;
//   int b = 10;
//   int result = sum(a, b);
//   print('The sum of $a and $b is $result');
// }

// int sum (int a, int b) {
//   return a + b;
// }

// void main(List<String> args) {
//   for (int a = 1; a <= 50; a++) {
//     if (a % 2 == 1) {
//       continue;
//     }
//     print(a);
//   }
// }

// void main() {
//   for (int i = 0; i < 10; i++) {
//     print(fibonacci(i));
//   }
// }

// int fibonacci(int n) {
//   if (n == 0 || n == 1) {
//     return n;
//   }
//   return fibonacci(n - 1) + fibonacci(n - 2);
// }

// void main(List<String> args) {
//   int num = 153;

//   if (isArmstrong(num)) {
//     print('$num is an Armstrong number.');
//   } else {
//     print('$num is not an Armstrong number.');
//   }
// }

// bool isArmstrong(int num) {
//   int original = num;
//   int sum = 0;
//   while (num > 0) {
//     int digit = num % 10;
//     sum += digit * digit * digit;
//     num ~/= 10;
//   }
//   return sum == original;
// }

// void main(List<String> args) {
//   List<String> num = ['1', '2', '3', '4', '5'];

//   String reversedStr = '';
//   for (int i = num.length - 1; i >= 0; i--) {
//     reversedStr += num[i];
//   }
//   print('Reversed string: $reversedStr');
// }
// void main() {
//   int num = 121;
//   int original = num;
//   int reverse = 0;

//   while (num > 0) {
//     int digit = num % 10;
//     reverse = reverse * 10 + digit;
//     num ~/= 10;
//   }

//   if (original == reverse) {
//     print('$original is a palindrome number');
//   } else {
//     print('$original is not a palindrome number');
//   }
// }

// void main(List<String> args) {
//   List<int> numbers = [10, 20, 30, 40, 50];

//   int largest = numbers[0];
//   int secondLargest = numbers[0];
//   for (var num in numbers) {
//     if (num > largest) {
//       secondLargest = largest;
//       largest = num;
//     } else if (num > secondLargest && num != largest) {
//       secondLargest = num;
//     }
//   }
//   print('Second largest number is $secondLargest');
// }

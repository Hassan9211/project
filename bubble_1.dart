// // void main(List<String> args) {
// //   List<int> number = [9, 7, 5, 6, 4, 10];
// //   print('before sorting: $number');
// //   bubbleSort(number);
// //   print('after sorting: $number');
// // }

// // void bubbleSort(List<int> list) {
// //   int n = list.length;

// //   for (int i = 0; i < n - 1; i++) {
// //     for (int j = 0; j < n - i - 1; j++) {
// //       if (list[j] > list[j + 1]) {
// //         int temp = list[j];
// //         list[j] = list[j + 1];
// //         list[j + 1] = temp;
// //       }
// //     }
// //   }
// // }

// //--- print staric ---

// // import 'dart:io';

// // void main(List<String> args) async {
// //   int n = 5;
// //   for (int i = 1; i < 0; i++) {
// //     for (int j = 1; j <= i; j++) {
// //       stdout.write('*');
     
// //     }
// //     await Future.delayed(Duration(seconds: 2));
// //     print('');

// //   }
// // }


// // 
// void main(List<String> args)async {
//   print('one');
//   await Future.delayed(Duration(seconds: 2));
//   print('two');
//   await Future.delayed(Duration(seconds: 2));
//   print('three');
//   await Future.delayed(Duration(seconds: 2));
//   print('four');
//   await Future.delayed(Duration(seconds: 2));
//   print('five');
//   await Future.delayed(Duration(seconds: 2));
//   print('six');
//   await Future.delayed(Duration(seconds: 2));
//   print('seven');
//   await Future.delayed(Duration(seconds: 2));
//   print('eight');
//   await Future .delayed(Duration(seconds: 2));
//   print('nine');
//   await Future.delayed(Duration(seconds: 2));
//   print('ten');

// }

void main(List<String> args) {
  Student student =Student('Hassan Raza', 27, 02027);

  // student.age;
  // student.name;
  // student.rollNo;
  studentInfo(student);

  
}



class Student{
  String name;
  int age;
  int rollNo;
  Student(this.name,this.age,this.rollNo);
}

void studentInfo(Student student){
  print('Name : ${student.name}');
  print('Age : ${student.age}'); // Corrected: student.age
  print('Roll No : ${student.rollNo}'); // Corrected: student.rollNo
}

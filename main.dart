import 'get_set.dart';
import 'new.dart';
void main(List<String> args) {
  Student student = Student();
 
  student.name = 'Hassan Raza';
  student.age = 27;
  student.rollno = 02027;

print('student name : ${student.name}');
print('student age : ${student.age}');
print('student rollno : ${student.rollno}');


Car car =Car('Buggati', 2025, 'red');
Bike bike =Bike('Honda', 2024, 'black');

print('Bike info:');
bike.carInfo();




print('car info:');
car.carInfo();




}
  

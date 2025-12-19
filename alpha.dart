void main(List<String> args) {
  //   Student student = Student('Hassan Raza', 27);
  //   student.studentInfo();
  // }
  //  Car car = Car('Fararri', 'FZR2000', 360000000);
  // car.carInfo();

  Laptop laptop = Laptop("Dell", "E5470", 60000);

  laptop.laptopInfo();
}

// class Student {
//   String? name;
//   int? age;

//   Student(this.name, this.age);

//   void studentInfo() {
//     print("Name: $name, Age: $age");
//   }

// class Car {
//   String name;
//   var brand;
//   int price;

//   Car(this.name, this.brand, this.price);

//   void carInfo() {
//     print("Car name: $name, Car brand: $brand, Car price: $price");
//   }
// }

class Laptop {
  String? name;
  String? brand;
  int? price;

  Laptop(this.name, this.brand, this.price);

  void laptopInfo() {
    double tax = (price ?? 0) * 0.10;
    double total = (price ?? 0) + tax;
    print("Name: $name");
    print("Brand: $brand");
    print("Price: $price");
    print("Tax (10%): $tax");
    print("Total Price: $total");
  }
}

import 'dart:io';

void main(List<String> args) {
  print("Laptop brand enter karein:");
  String brand = stdin.readLineSync()!;

  print("Laptop price enter karein:");
  double price = double.parse(stdin.readLineSync()!);

  print("Tax percentage enter karein:");
  double taxPercent = double.parse(stdin.readLineSync()!);

  // Object banaya
  Laptop myLaptop = Laptop(brand, price);

  // Method call + return value
  double totalPrice = myLaptop.calculateTotalPrice(taxPercent);

  print("\n----- BILL -----");
  print("Brand: $brand");
  print("Total Price (with tax): $totalPrice");
}

class Laptop {
  String brand;
  double price;

  // Constructor
  Laptop(this.brand, this.price);

  // Method jo value RETURN karta hai
  double calculateTotalPrice(double taxPercent) {
    double tax = price * taxPercent / 100;
    double total = price + tax;
    return total;
  }
}

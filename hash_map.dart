import 'dart:io';

void main(List<String> args) async {

  Map<String, dynamic> fruitDetail = {
    'Apple': 200,
    'Banana': 220,
    'Charry': 300,
  };

  // print(fruitDetail['Apple']);

  fruitDetail['Orange'] = 80;
  fruitDetail['Mango'] = 150;
  fruitDetail['Grapes'] = 400;
  fruitDetail['Peach'] = 400;

  // print(fruitDetail['Peach']);

  fruitDetail.remove('Banana');
  fruitDetail.remove('Mango');

  print(fruitDetail);

 
  print("\nEnter fruit name:");
  String? name = stdin.readLineSync();

  print("Enter fruit price:");
  String? priceInput = stdin.readLineSync();

  // Convert price to int
  int? price = int.tryParse(priceInput ?? "");

  if (name != null && price != null) {
    fruitDetail[name] = price;
    await Future.delayed(Duration(seconds: 2));
    print("\nFruit added successfully!");
  } else {
    print("\nInvalid input!");
  }
   await Future.delayed(Duration(seconds: 2));

  print("\nUpdated fruit details:");
  print(fruitDetail);
}

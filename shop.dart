import 'dart:io';

void main() {
  Map<String, int> fruits = {
    'Apple': 200,
    'Banana': 100,
    'Cherry': 300,
  };

  while (true) {
    print("\n====== Fruit Management System ======");
    print("1. Add Fruit");
    print("2. Update Fruit Price");
    print("3. Delete Fruit");
    print("4. Search Fruit");
    print("5. Show All Fruits");
    print("6. Sort Fruits (A-Z)");
    print("7. Sort by Price (Low to High)");
    print("8. Clear All Fruits");
    print("9. Exit");
    stdout.write("Select option: ");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addFruit(fruits);
        break;

      case 2:
        updateFruit(fruits);
        break;

      case 3:
        deleteFruit(fruits);
        break;

      case 4:
        searchFruit(fruits);
        break;

      case 5:
        showAll(fruits);
        break;

      case 6:
        sortAZ(fruits);
        break;

      case 7:
        sortByPrice(fruits);
        break;

      case 8:
        fruits.clear();
        print("All fruits removed!");
        break;

      case 9:
        print("Exiting program...");
        return;

      default:
        print("Invalid choice! Try again.");
    }
  }
}

// ───────────────────────────────────────────────
// FUNCTIONS
// ───────────────────────────────────────────────

void addFruit(Map<String, int> fruits) {
  stdout.write("Enter fruit name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter price: ");
  int price = int.parse(stdin.readLineSync()!);

  fruits[name] = price;
  print("$name added successfully!");
}

void updateFruit(Map<String, int> fruits) {
  stdout.write("Enter fruit to update: ");
  String name = stdin.readLineSync()!;

  if (fruits.containsKey(name)) {
    stdout.write("Enter new price: ");
    int price = int.parse(stdin.readLineSync()!);

    fruits[name] = price;
    print("$name updated!");
  } else {
    print("$name not found!");
  }
}

void deleteFruit(Map<String, int> fruits) {
  stdout.write("Enter fruit to delete: ");
  String name = stdin.readLineSync()!;

  if (fruits.remove(name) != null) {
    print("$name deleted!");
  } else {
    print("$name not found!");
  }
}

void searchFruit(Map<String, int> fruits) {
  stdout.write("Enter fruit name to search: ");
  String name = stdin.readLineSync()!;

  if (fruits.containsKey(name)) {
    print("$name price = ${fruits[name]}");
  } else {
    print("$name not found!");
  }
}

void showAll(Map<String, int> fruits) {
  print("\n===== All Fruits =====");
  fruits.forEach((key, value) {
    print("$key : Rs $value");
  });
}

void sortAZ(Map<String, int> fruits) {
  print("\n===== Sorted A-Z =====");
  var sortedKeys = fruits.keys.toList()..sort();

  for (var key in sortedKeys) {
    print("$key : ${fruits[key]}");
  }
}

void sortByPrice(Map<String, int> fruits) {
  print("\n===== Sorted by Price (Low → High) =====");
  var sortedEntries = fruits.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));

  for (var entry in sortedEntries) {
    print("${entry.key} : Rs ${entry.value}");
  }
}

import 'dart:convert';
import 'dart:io';

// ─────────────────────────────────────────────
// DATA MODEL
// ─────────────────────────────────────────────

class Fruit {
  String id;
  String name;
  int price;
  int quantity;

  Fruit(this.id, this.name, this.price, this.quantity);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  static Fruit fromJson(Map<String, dynamic> json) {
    return Fruit(
      json['id'],
      json['name'],
      json['price'],
      json['quantity'],
    );
  }
}

// ─────────────────────────────────────────────
// MAIN APP
// ─────────────────────────────────────────────

void main() async {
  const username = "admin";
  const pin = "1234";

  print("==== Login Required ====");
  stdout.write("Enter username: ");
  String user = stdin.readLineSync()!;

  stdout.write("Enter PIN: ");
  String pass = stdin.readLineSync()!;

  if (user != username || pass != pin) {
    print("❌ Wrong Credentials! Exiting...");
    return;
  }

  print("✅ Login Successful!");

  Map<String, Fruit> inventory = await loadData();

  while (true) {
    print("\n====== ADVANCED FRUIT INVENTORY ======");
    print("1. Add Fruit");
    print("2. Update Fruit Price");
    print("3. Add Stock");
    print("4. Remove Stock");
    print("5. Delete Fruit");
    print("6. Search Fruit");
    print("7. Show All Fruits");
    print("8. Sort (A-Z)");
    print("9. Sort by Price");
    print("10. Sort by Quantity");
    print("11. Apply Discount");
    print("12. Show Total Inventory Value");
    print("13. Save Data");
    print("14. Backup");
    print("15. Restore Backup");
    print("16. Exit");

    stdout.write("Choose option: ");
    int option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        addFruit(inventory);
        break;

      case 2:
        updatePrice(inventory);
        break;

      case 3:
        addStock(inventory);
        break;

      case 4:
        removeStock(inventory);
        break;

      case 5:
        deleteFruit(inventory);
        break;

      case 6:
        searchFruit(inventory);
        break;

      case 7:
        showAll(inventory);
        break;

      case 8:
        sortAZ(inventory);
        break;

      case 9:
        sortByPrice(inventory);
        break;

      case 10:
        sortByQuantity(inventory);
        break;

      case 11:
        applyDiscount(inventory);
        break;

      case 12:
        inventoryValue(inventory);
        break;

      case 13:
        await saveData(inventory);
        break;

      case 14:
        await backup();
        break;

      case 15:
        inventory = await restoreBackup();
        break;

      case 16:
        print("Exiting...");
        return;

      default:
        print("❌ Invalid option!");
    }
  }
}

// ─────────────────────────────────────────────
// FUNCTIONS
// ─────────────────────────────────────────────

void addFruit(Map<String, Fruit> inventory) {
  stdout.write("Enter fruit name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter price: ");
  int price = int.parse(stdin.readLineSync()!);

  stdout.write("Enter quantity: ");
  int qty = int.parse(stdin.readLineSync()!);

  String id = DateTime.now().millisecondsSinceEpoch.toString();

  inventory[id] = Fruit(id, name, price, qty);

  print("🍏 $name added successfully!");
}

void updatePrice(Map<String, Fruit> inventory) {
  stdout.write("Enter fruit name: ");
  String name = stdin.readLineSync()!;

  for (var fruit in inventory.values) {
    if (fruit.name == name) {
      stdout.write("Enter new price: ");
      fruit.price = int.parse(stdin.readLineSync()!);
      print("✅ Price updated!");
      return;
    }
  }

  print("❌ Fruit not found!");
}

void addStock(Map<String, Fruit> inventory) {
  stdout.write("Enter fruit name: ");
  String name = stdin.readLineSync()!;

  for (var fruit in inventory.values) {
    if (fruit.name == name) {
      stdout.write("Add quantity: ");
      int qty = int.parse(stdin.readLineSync()!);
      fruit.quantity += qty;
      print("📦 Stock Updated!");
      return;
    }
  }

  print("❌ Fruit not found!");
}

void removeStock(Map<String, Fruit> inventory) {
  stdout.write("Enter fruit name: ");
  String name = stdin.readLineSync()!;

  for (var fruit in inventory.values) {
    if (fruit.name == name) {
      stdout.write("Remove quantity: ");
      int qty = int.parse(stdin.readLineSync()!);

      if (qty > fruit.quantity) {
        print("❌ Not enough stock!");
      } else {
        fruit.quantity -= qty;
        print("➖ Stock Reduced!");
      }
      return;
    }
  }

  print("❌ Fruit not found!");
}

void deleteFruit(Map<String, Fruit> inventory) {
  stdout.write("Enter fruit name: ");
  String name = stdin.readLineSync()!;

  inventory.removeWhere((key, value) => value.name == name);

  print("🗑️ $name deleted!");
}

void searchFruit(Map<String, Fruit> inventory) {
  stdout.write("Enter fruit name: ");
  String name = stdin.readLineSync()!;

  for (var fruit in inventory.values) {
    if (fruit.name == name) {
      print("\nFOUND:");
      print("ID: ${fruit.id}");
      print("Name: ${fruit.name}");
      print("Price: ${fruit.price}");
      print("Qty: ${fruit.quantity}");
      return;
    }
  }

  print("❌ Not found!");
}

void showAll(Map<String, Fruit> inventory) {
  print("\n======= INVENTORY =======");
  inventory.forEach((key, f) {
    print("${f.name} → Rs ${f.price}  | Qty: ${f.quantity}");
    if (f.quantity <= 5) print("⚠ LOW STOCK WARNING");
  });
}

void sortAZ(Map<String, Fruit> inventory) {
  var list = inventory.values.toList()
    ..sort((a, b) => a.name.compareTo(b.name));

  list.forEach((f) => print("${f.name} : Rs ${f.price}"));
}

void sortByPrice(Map<String, Fruit> inventory) {
  var list = inventory.values.toList()
    ..sort((a, b) => a.price.compareTo(b.price));

  list.forEach((f) => print("${f.name} : Rs ${f.price}"));
}

void sortByQuantity(Map<String, Fruit> inventory) {
  var list = inventory.values.toList()
    ..sort((a, b) => a.quantity.compareTo(b.quantity));

  list.forEach((f) => print("${f.name} : Qty ${f.quantity}"));
}

void applyDiscount(Map<String, Fruit> inventory) {
  stdout.write("Enter fruit name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Discount %: ");
  int d = int.parse(stdin.readLineSync()!);

  for (var f in inventory.values) {
    if (f.name == name) {
      f.price = f.price - (f.price * d ~/ 100);
      print("💸 Discount Applied!");
      return;
    }
  }
}

void inventoryValue(Map<String, Fruit> inventory) {
  int total = 0;

  inventory.values.forEach((e) {
    total += e.price * e.quantity;
  });

  print("💰 Total Inventory Value: Rs $total");
}

// ─────────────────────────────────────────────
// FILE HANDLING
// ─────────────────────────────────────────────

Future<void> saveData(Map<String, Fruit> inventory) async {
  File file = File("fruits.json");

  List data = inventory.values.map((e) => e.toJson()).toList();

  await file.writeAsString(jsonEncode(data));

  print("💾 Data Saved!");
}

Future<Map<String, Fruit>> loadData() async {
  File file = File("fruits.json");

  if (!file.existsSync()) return {};

  String content = file.readAsStringSync();

  List list = jsonDecode(content);

  Map<String, Fruit> inventory = {};

  for (var item in list) {
    Fruit f = Fruit.fromJson(item);
    inventory[f.id] = f;
  }

  print("📂 Data Loaded!");

  return inventory;
}

Future<void> backup() async {
  File mainFile = File("fruits.json");
  File backupFile = File("backup.json");

  if (mainFile.existsSync()) {
    await backupFile.writeAsString(mainFile.readAsStringSync());
    print("📀 Backup created!");
  } else {
    print("❌ No data to backup!");
  }
}

Future<Map<String, Fruit>> restoreBackup() async {
  File backupFile = File("backup.json");

  if (!backupFile.existsSync()) {
    print("❌ No backup file found!");
    return {};
  }

  String content = backupFile.readAsStringSync();
  List list = jsonDecode(content);

  Map<String, Fruit> inventory = {};

  for (var item in list) {
    Fruit f = Fruit.fromJson(item);
    inventory[f.id] = f;
  }

  print("♻ Backup Restored!");

  return inventory;
}

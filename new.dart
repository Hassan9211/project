class Car {
  String? name;
  int? model;
  String? color;

  Car(this.name, this.model, this.color);

  void carInfo() {
    print('Name : $name');
    print('Model : $model');
    print('Color : $color');
  }
}


class Bike extends Car {
  Bike(super.name, super.model, super.color);

  @override
  void carInfo() {
    super.carInfo(); 
  }
}





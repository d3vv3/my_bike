class Vehicle {

  // Attributes
  int id;
  String name;
  String model;
  String iconURL;
  String type; // Motorcycle, Car
  int mileage;
  int year;
  String licensePlate;
  int displacement; // cubic capacity or cubic centimeters
  int cylinders;
  String fuelType; // Diesel, Gasoline, Electric, LPG, Hybrid
  double consumption;

  // Constructor
  Vehicle({this.id, this.name, this.model, this.iconURL, this.type, this.mileage, this.year, this.licensePlate, this.displacement, this.cylinders, this.fuelType, this.consumption});

  // Methods
  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      "name": name,
      "model": model,
      "iconURL": iconURL,
      "type": type,
      "mileage": mileage,
      "year": year,
      "licensePlate": licensePlate,
      "displacement": displacement,
      "cylinders": cylinders,
      "fuelType": fuelType,
      "consumption": consumption
    };

    if(id != null) {
      map["id"] = id;
    }

    return map;
  }

  Vehicle.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    model = map["model"];
    iconURL = map["iconURL"];
    type = map["type"];
    mileage = map["mileage"];
    year = map["year"];
    licensePlate = map["licensePlate"];
    displacement = map["displacement"];
    cylinders = map["cylinders"];
    fuelType = map["fuelType"];
    consumption = map["consumption"];

  }
}


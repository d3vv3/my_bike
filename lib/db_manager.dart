import 'dart:core';

import 'package:my_bike/models/component.dart';
import 'package:my_bike/models/vehicle.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future<String> getDBPath() async {
  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'my_bike.db');
  return path;
}

Future<bool> deleteDB() async {
  try {
    var path = await getDBPath();
    await deleteDatabase(path);
    return true;
  } catch (e) {
    return false;
  }
}

Future<Database> initializeDB() async {
  var path = await getDBPath();
  // open the database
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Vehicle ('
                'id INTEGER PRIMARY KEY NOT NULL, '
                'name TEXT UNIQUE, '
                'model TEXT, '
                'iconURL TEXT, '
                'type TEXT, '
                'mileage INTEGER, '
                'year INTEGER, '
                'licensePlate TEXT UNIQUE, '
                'displacement INTEGER, '
                'cylinders INTEGER, '
                'fuelType TEXT, '
                'consumption REAL)'
            );
        await db.execute(
            'CREATE TABLE Components ('
                'id INTEGER PRIMARY KEY NOT NULL, '
                'vehicleId INTEGER NOT NULL, '
                'name TEXT, '
                'iconURL TEXT, '
                'mileageLifeSpan INTEGER, '
                'FOREIGN KEY (vehicleId) REFERENCES Vehicle(id))'
            );
      });
  return database;
}


Future<Vehicle> insertVehicleIntoDB(Database database, Vehicle vehicle) async {
  vehicle.id = await database.insert("Vehicle", vehicle.toMap());
  return vehicle;
}

Future<Component> insertComponent (Database database, Component component) async {
  component.id = await database.insert("Component", component.toMap());
  return component;
}

Future<List<Vehicle>> getVehicles(Database database) async {

  var vehicles = await database.query(
      "Vehicle",
      columns: ["id", "name", "model",
        "iconURL", "type", "mileage",
        "year", "licensePlate", "displacement",
        "cylinders", "fuelType", "consumption"]
  );
  List<Vehicle> vehicleList = List<Vehicle>();

  vehicles.forEach((currentVehicle) {
    Vehicle vehicle = Vehicle.fromMap(currentVehicle);
    vehicleList.add(vehicle);
  });

  return vehicleList;
}

Future<List<Component>> getComponents(Database database) async {

  var components = await database.query(
      "Component",
      columns: ["id", "vehicleId", "name", "iconURL", "mileageLifeSpan"]
  );
  List<Component> componentList = List<Component>();

  components.forEach((currentComponent) {
    Component component = Component.fromMap(currentComponent);
    componentList.add(component);
  });

  return componentList;
}
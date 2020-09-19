import 'package:flutter/material.dart';
import 'package:my_bike/db_manager.dart';
import 'package:my_bike/models/vehicle.dart';
import 'package:my_bike/pages/widgets/garage_widget.dart';
import 'package:my_bike/pages/widgets/vehicle_form_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Bike',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[50],
        accentColor: Colors.blueGrey[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _database;
  List<Vehicle> _garage;

  @override
  void initState() {
    initializeDB().then((database){
      getVehicles(database).then((vehicleList){
        this.setState(() {
          _database = database;
          _garage = vehicleList;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        centerTitle: true,
        elevation: 0.0,
        /*
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.blueGrey[900],
          onPressed: () {},
        ),

         */
      title: Text("My bikes",
              style: TextStyle(fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900]),
      ),
      ),
      body: (_garage != null) ? GaragePage(database: _database, garage: _garage) : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var navigationResult = await Navigator.push(context, new MaterialPageRoute(builder: (context) => VehicleInputWidget()));

      if (navigationResult == true) {
        print("Vehicle saved");
      }
      else {
        print("Vehicle not saved");
      }
      var newGarage = await getVehicles(_database);
      setState(() {
        _garage = newGarage;
      });
      print(newGarage.length);
      print(_garage.length);
        },
        tooltip: 'Add vehicle',
        child: Icon(Icons.add),
        backgroundColor: Colors.red[700],
      ),
    );
  }
}

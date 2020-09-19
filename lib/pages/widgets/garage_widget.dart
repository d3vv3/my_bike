import 'package:flutter/material.dart';
import 'package:my_bike/db_manager.dart';
import 'package:my_bike/pages/widgets/vehicle_card_widget.dart';


class GaragePage extends StatefulWidget {

  final garage;
  final database;
  GaragePage({
    var database,
    var garage
  }): this.garage = garage, this.database = database;

  @override
  _GaragePageState createState() => _GaragePageState(database, garage);
}

class _GaragePageState extends State<GaragePage> {

  _GaragePageState(this.database, this.garage);
  final garage;
  final database;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

              for(var vehicle in widget.garage) Dismissible(
                  key: UniqueKey(), // GlobalKey(),
                  onDismissed: (direction) async {
                    var result = await removeVehicleFromDB(database, vehicle);
                    print(result);
                    this.setState(() {
                      widget.garage.remove(vehicle);
                    });
                  },
                  child: VehicleCard(vehicle, database))

            ]
      ),
    );
  }
}
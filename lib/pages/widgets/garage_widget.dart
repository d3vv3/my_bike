import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bike/pages/widgets/vehicle_card_widget.dart';


class GaragePage extends StatefulWidget {
  // @override
  final garage;
  GaragePage({
    var garage
  }): this.garage = garage;
  _GaragePageState createState() => _GaragePageState(garage);
}

class _GaragePageState extends State<GaragePage> {

  _GaragePageState(this.garage);
  final garage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

              //_buildVehicleCard(_garage[0])
              for(var vehicle in widget.garage) VehicleCard(vehicle)

            ]
      ),
    );
  }

}
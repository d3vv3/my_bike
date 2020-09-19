import 'package:flutter/material.dart';
import 'package:my_bike/models/vehicle.dart';
import 'package:my_bike/pages/widgets/components_page_widget.dart';


class VehicleCard extends StatelessWidget {

  VehicleCard(this.vehicle, this.database);

  final Vehicle vehicle;
  final database;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        margin: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: InkWell(
          splashColor: Colors.redAccent,
          highlightColor: Colors.blueGrey[100],
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          onTap: () async {
            var navigationResult = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ComponentsPage(vehicle: vehicle)));

            if (navigationResult == true) {
              print("Returned nice");
            }
            else {
              print("Backed");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Center(
                        child: Image(
                            image: AssetImage("${vehicle.iconURL}"),
                            width: 120),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("${vehicle.name}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),),
                          ),

                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text("${vehicle.model}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text("${vehicle.licensePlate}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Text("${vehicle.displacement}cc",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text("${vehicle.year}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text("${vehicle.mileage} km",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),),
                                        ),
                                      ],
                                    ),

                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

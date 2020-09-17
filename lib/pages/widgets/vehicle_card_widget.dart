import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_bike/models/vehicle.dart';


class VehicleCard extends StatelessWidget {

  VehicleCard(this.vehicle);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        margin: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
        child: InkWell(
          splashColor: Colors.redAccent,
          highlightColor: Colors.blueGrey[100],
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          onTap: (){ print("Card Clicked"); },
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
                      child: CachedNetworkImage(
                          placeholder: (context, url) => CircularProgressIndicator(),
                          imageUrl: "${vehicle.iconURL}",
                          width: 120),
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

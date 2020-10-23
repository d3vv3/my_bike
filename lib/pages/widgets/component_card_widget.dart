import 'package:flutter/material.dart';
import 'package:my_bike/models/component.dart';
import 'package:my_bike/models/vehicle.dart';
import 'package:percent_indicator/percent_indicator.dart';


class ComponentCard extends StatelessWidget {

  ComponentCard(this.component, this.vehicle);

  final Component component;
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
          onTap: () async {
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
                          image: AssetImage("${component.iconURL}"),
                          width: 120,
                          )
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
                            child: Text("${component.name}",
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
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: LinearPercentIndicator(
                                        width: 180.0,
                                        lineHeight: 14.0,
                                        percent: calcPercentage(vehicle, component),
                                        backgroundColor: Colors.blueGrey[100],
                                        progressColor: (calcPercentage(vehicle, component) > 0.75) ? Colors.red[600] : Colors.blueGrey[400],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 4, top: 6),
                                      child: Text("${calcMileageLeft(vehicle, component)}km left",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.blueGrey[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),),
                                    ),
                                    )
                                ],
                              ),
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

double calcPercentage(vehicle, component) {
  if (component.mileageLifespan == 0 || vehicle.mileage == 0) {
    return 0;
  }
  var result = (vehicle.mileage - component.startMileage)/component.mileageLifespan;
  if (result > 1) {
    return 1;
  }
  if (result < 0) {
    return 0;
  }
  return result;
}

int calcMileageLeft(vehicle, component) {
  if (component.mileageLifespan == 0) {
    return 0;
  }
  if (component.startMileage > vehicle.mileage) {
    return 0;
  }
  var result = component.mileageLifespan -(vehicle.mileage - component.startMileage);
  if (result < 0) {
    return 0;
  }
  print("Vehicle mileage: ${vehicle.mileage}");
  print("Component lifespan: ${component.mileageLifespan}");
  print("Mileage: ${component.startMileage}");
  print("Left: $result");
  return result;
}
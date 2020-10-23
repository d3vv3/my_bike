import 'package:flutter/material.dart';
import 'package:my_bike/db_manager.dart';
import 'package:my_bike/models/vehicle.dart';
import 'package:my_bike/pages/widgets/components_page_widget.dart';


class VehicleCard extends StatefulWidget {

  final Vehicle vehicle;
  final database;
  VehicleCard(
  {var vehicle,
    var database
}): this.vehicle = vehicle, this.database = database;

  @override
  _VehicleCardState createState() => _VehicleCardState(database, vehicle);
}

class _VehicleCardState extends State<VehicleCard> {

  _VehicleCardState(this.database, this.vehicle);
  var vehicle;
  var database;
  TextEditingController _mileageController = new TextEditingController();

  @override
  initState(){
    var _mileageController = new TextEditingController();
    super.initState();
  }


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
          onLongPress: () {
            // TODO: May the user need to edit other vehicle info?
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Update vehicle's mileage"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                content: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _mileageController,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.swap_horiz, color: Colors.blueGrey),
                          border: InputBorder.none,
                          labelText: "Mileage",
                          labelStyle: TextStyle(
                              color: Colors.blueGrey[600]
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                actions: <Widget>[
                  new FlatButton(
                      child: const Text('Cancel'),
                      textColor: Colors.red[700],
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  new FlatButton(
                      child: const Text('Update'),
                      textColor: Colors.red[700],
                      onPressed: () {
                        if (_mileageController.text != null) {
                          this.setState(() {
                            widget.vehicle.mileage = int.parse(_mileageController.text);

                          });
                          updateVehicleMileage(widget.database, widget.vehicle);
                        }
                        Navigator.pop(context);
                      })
                ],
              ),
            );
          },
          onTap: () async {
            var navigationResult = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ComponentsPage(vehicle: widget.vehicle)));

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
                            image: AssetImage("${widget.vehicle.iconURL}"),
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
                            child: Text("${widget.vehicle.name}",
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

                                    Text("${widget.vehicle.model}",
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
                                          child: Text("${widget.vehicle.licensePlate}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Text("${widget.vehicle.displacement}cc",
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
                                          child: Text("${widget.vehicle.year}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text("${widget.vehicle.mileage} km",
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

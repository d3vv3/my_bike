import 'package:flutter/material.dart';
import 'package:my_bike/db_manager.dart';
import 'package:my_bike/models/vehicle.dart';
import 'package:validators/validators.dart';


class VehicleInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.blueGrey[900],
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        title: Text("New bike",
          style: TextStyle(fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900]),
        ),
      ),
      body: InputForm(),
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();

}

class _InputFormState extends State<InputForm> {

  var _database;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _vehicle = new Map<String, dynamic>();
  // Vehicle _vehicle = Vehicle();

  @override
  void initState() {
    initializeDB().then((database){
      _database = database;
    });
    super.initState();
  }

  Widget _buildModelField() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
        child: TextFormField(
          style: TextStyle(
            color: Colors.blueGrey[900],
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Model",
              labelStyle: TextStyle(
                color: Colors.blueGrey[600]
              ),
          ),
          // ignore: missing_return
          validator: (String value){
            if(value.isEmpty){
              return 'Model is required';
            }
          },
          onSaved: (String value) {
            _vehicle["model"] = value;
          },
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
        child: TextFormField(
          style: TextStyle(
            color: Colors.blueGrey[900],
          ),
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Name",
          labelStyle: TextStyle(
              color: Colors.blueGrey[600]
          ),
    ),
      // ignore: missing_return
    validator: (String value){
    if(value.isEmpty){
    return 'Name is required';
    }
    },
    onSaved: (String value) {
    _vehicle["name"] = value;
    },
    ),),);
  }

  Widget _buildIconURLField() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
        child: TextFormField(
          style: TextStyle(
            color: Colors.blueGrey[900],
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Icon URL",
            labelStyle: TextStyle(
                color: Colors.blueGrey[600]
            ),
          ),
          // ignore: missing_return
          validator: (String value){
            if(value.isEmpty){
              return 'Icon URL is required';
            }
          },
          onSaved: (String value) {
            _vehicle["iconURL"] = value;
          },
        ),),);
  }

  Widget _buildTypeField() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
        child: TextFormField(
          style: TextStyle(
            color: Colors.blueGrey[900],
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Type",
            labelStyle: TextStyle(
                color: Colors.blueGrey[600]
            ),
          ),
          // ignore: missing_return
          validator: (String value){
            if(value.isEmpty){
              return 'Type must be Bike or Car';
            }
          },
          onSaved: (String value) {
            _vehicle["type"] = value;
          },
        ),),);

  }

  Widget _buildMileageField() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
    child: TextFormField(
      style: TextStyle(
        color: Colors.blueGrey[900],
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Mileage",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Mileage is required';
        }
        if(!isNumeric(value)){
          return 'Mileage must be a number';
        }
      },
      onSaved: (String value) {
        _vehicle["mileage"] = int.parse(value);
      },
    ),),);
  }

  Widget _buildYearField() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
    child: TextFormField(
      style: TextStyle(
        color: Colors.blueGrey[900],
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Year",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Year is required';
        }
        if(!isNumeric(value)){
          return 'Year must be a number';
        }
      },
      onSaved: (String value) {
        _vehicle["year"] = int.parse(value);
      },
    ),),);
  }

  Widget _buildLicensePlateField() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
    child: TextFormField(
      style: TextStyle(
        color: Colors.blueGrey[900],
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "License Plate",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'License Plate is required';
        }
      },
      onSaved: (String value) {
        _vehicle["licensePlate"] = value;
      },
    ),),);
  }

  Widget _buildDisplacementField() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
    child: TextFormField(
      style: TextStyle(
        color: Colors.blueGrey[900],
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Displacement",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Displacement is required';
        }
        if(!isNumeric(value)){
          return 'Displacement must be a number';
        }
      },
      onSaved: (String value) {
        _vehicle["displacement"] = int.parse(value);
      },
    ),),);
  }

  Widget _buildCylindersField() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
    child: TextFormField(
      style: TextStyle(
        color: Colors.blueGrey[900],
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Cylinders",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){

        if(value.isEmpty){
          return 'Cylinders is required';
        }
        if(!isNumeric(value)){
          return 'Cylinders must be a number';
        }
      },
      onSaved: (String value) {
        _vehicle["cylinders"] = int.parse(value);
      },
    ),),);
  }

  Widget _buildFuelTypeField() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
    child: TextFormField(
      style: TextStyle(
        color: Colors.blueGrey[900],
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Fuel Type",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Fuel type is required';
        }
      },
      onSaved: (String value) {
        _vehicle["fuelType"] = value;
      },
    ),),);
  }

  Widget _buildConsumptionField() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
    child: TextFormField(
      style: TextStyle(
        color: Colors.blueGrey[900],
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Consumption",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Consumption is required';
        }
        if(double.parse(value) == double.nan){
          return 'Consumption must be a decimal number';
        }
      },
      onSaved: (String value) {
        _vehicle["consumption"] = double.parse(value);
      },
    ),),);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(31, 0, 31, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                _buildModelField(),
                _buildNameField(),
                _buildIconURLField(),
                _buildTypeField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  Expanded(child: _buildMileageField()),
                  Expanded(child: _buildYearField()),
                ],),
                _buildLicensePlateField(),
                _buildDisplacementField(),
                _buildCylindersField(),
                _buildFuelTypeField(),
                _buildConsumptionField(),


                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
                  child: RaisedButton(
                    child: SizedBox(
                      height: 40,
                      width: 80,
                      child: Row(

                        children: [
                          Icon(Icons.save),
                          Spacer(),
                          Text("Save",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),)
                        ],
                      ),
                    ),
                    textColor: Colors.blueGrey[50],
                    color: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: () async {
                      if(!_formKey.currentState.validate()){
                        return;
                      }
                      _formKey.currentState.save();
                      Vehicle vehicle = new Vehicle.fromMap(_vehicle);
                      await initializeDB();
                      var result = await insertVehicleIntoDB(_database, vehicle);
                      print(result);
                      Navigator.pop(context, true);
                    },
                  ),
                )

                ]
          ),
        )
      ),
    );
  }
}
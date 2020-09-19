import 'package:flutter/material.dart';
import 'package:my_bike/db_manager.dart';
import 'package:my_bike/models/component.dart';
import 'package:my_bike/models/vehicle.dart';



class ComponentInputWidget extends StatelessWidget {

  ComponentInputWidget(this.vehicle);

  final Vehicle vehicle;

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
        title: Text("New component",
          style: TextStyle(fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900]),
        ),
      ),
      body: InputForm(vehicle: vehicle),
    );
  }
}

class InputForm extends StatefulWidget {
  final vehicle;
  InputForm({
    var vehicle
  }): this.vehicle = vehicle;

  @override
  _InputFormState createState() => _InputFormState(vehicle);

}

class _InputFormState extends State<InputForm> {

  _InputFormState(this.vehicle);
  var vehicle;
  var _database;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _component = new Map<String, dynamic>();
  // Vehicle _vehicle = Vehicle();

  @override
  void initState() {
    initializeDB().then((database){
      _database = database;
    });
    super.initState();
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
          prefixIcon: Icon(Icons.tag_faces, color: Colors.blueGrey),
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
    _component["name"] = value;
    },
    ),),);
  }

  Widget _buildIconURLField2() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: DropdownButtonFormField(

            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add_photo_alternate, color: Colors.blueGrey),
              // prefixIcon: Icon(Icons.insert_emoticon),
              border: InputBorder.none,
              labelText: "Component icon",
              labelStyle: TextStyle(
                  color: Colors.blueGrey[600]
              ),
            ),
            iconSize: 0,
            dropdownColor: Colors.blueGrey[50],
            items: [

              DropdownMenuItem(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage("images/icons/components/oil.png"),
                      width: 80,
                    ),
                  ),
                ),
                value: "images/icons/components/oil.png"
              ),

              DropdownMenuItem(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("images/icons/components/tire.png"),
                    width: 80,
                  ),
                ),
              ),
              value: "images/icons/components/tire.png"
              ),

              DropdownMenuItem(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage("images/icons/components/brakes.png"),
                        width: 80
                      ),
                    ),
                  ),
                  value: "images/icons/components/brakes.png"
              ),

              DropdownMenuItem(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                          image: AssetImage("images/icons/components/chain.png"),
                          width: 80
                      ),
                    ),
                  ),
                  value: "images/icons/components/chain.png"
              ),

            ],
            onChanged: (content) {},
            // ignore: missing_return
            validator: (String value){
              if(value.isEmpty){
                return 'Icon URL is required';
              }
            },
            onSaved: (String value) {
              _component["iconURL"] = value;
            },
        )
      )
    );
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
            _component["iconURL"] = value;
          },
        ),),);
  }

  Widget _buildStartMileageField() {
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
          prefixIcon: Icon(Icons.add_location, color: Colors.blueGrey),
          border: InputBorder.none,
          labelText: "Start mileage",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Start mileage is required';
        }
        if(double.parse(value, (e) => null) == null){
          return 'Start mileage must be a number';
        }
      },
      onSaved: (String value) {
        _component["startMileage"] = int.parse(value);
      },
    ),),);
  }

  Widget _buildMileageLifeSpanField() {
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
          prefixIcon: Icon(Icons.watch_later, color: Colors.blueGrey,),
          border: InputBorder.none,
          labelText: "Mileage lifespan",
        labelStyle: TextStyle(
            color: Colors.blueGrey[600]
        ),
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Mileage lifespan is required';
        }
        if(double.parse(value, (e) => null) == null){
          return 'Mileage lifespan must be a number';
        }
        if(int.parse(value) == 0) {
          return 'Lifespan cannot be 0!';
        }
      },
      onSaved: (String value) {
        _component["mileageLifespan"] = int.parse(value);
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

                _buildNameField(),
                _buildIconURLField2(),
                _buildStartMileageField(),
                _buildMileageLifeSpanField(),

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
                      _component["vehicleId"] = vehicle.id;
                      print(_component);
                      Component component = new Component.fromMap(_component);
                      await initializeDB();
                      var result = await insertComponentIntoDB(_database, component);
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
import 'package:flutter/material.dart';
import 'package:my_bike/db_manager.dart';
import 'package:my_bike/models/component.dart';
import 'package:my_bike/pages/widgets/component_card_widget.dart';
import 'package:my_bike/pages/widgets/component_form_widget.dart';

class ComponentsPage extends StatefulWidget {

  final vehicle;
  ComponentsPage({
    var vehicle
  }): this.vehicle = vehicle;

  @override
  _ComponentsPageState createState() => _ComponentsPageState(vehicle);
}

class _ComponentsPageState extends State<ComponentsPage> {

  _ComponentsPageState(this.vehicle);

  final vehicle;
  List<Component> components;
  var _database;

  @override
  void initState() {
    initializeDB().then((database){
      getComponents(database, vehicle.id).then((componentList){
        this.setState(() {
          _database = database;
          components = componentList;
        });
        });
      });
    super.initState();
  }

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
        title: Text("${widget.vehicle.name}",
          style: TextStyle(fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900]),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var navigationResult = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ComponentInputWidget(widget.vehicle)));

            if (navigationResult == true) {
              print("Component saved");
            }
            else {
              print("Component not saved");
            }
            var newComponents = await getComponents(_database, vehicle.id);
            setState(() {
              components = newComponents;
            });
          },
          tooltip: 'Add a component to track',
          child: Icon(Icons.add),
          backgroundColor: Colors.red[700],
        ),
      body: SingleChildScrollView(
        child: Column(
            children: (components != null && vehicle != null)
                ? <Widget>[

                  //_buildVehicleCard(_garage[0])
                  for(var component in components) ComponentCard(component, widget.vehicle)

                  ]
                : <Widget>[Container()]
        ),
      )
    );
  }
}

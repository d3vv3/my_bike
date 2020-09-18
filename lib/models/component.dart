class Component {

  // Attributes
  int id;  //
  int vehicleId;  // Vehicle's id for relation between objects
  String name;  // Name for the component
  String iconURL;  // URL to icon
  int startMileage; //Mileage the vehicle had when component added
  int mileageLifespan; // Mileage expected before component needs change

  // Constructor
  Component({this.id, this.vehicleId, this.name, this.iconURL, this.startMileage, this.mileageLifespan});

  // Methods
  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      "vehicleId": vehicleId,
      "name": name,
      "iconURL": iconURL,
      "startMileage": startMileage,
      "mileageLifespan": mileageLifespan,
    };

    if(id != null) {
      map["id"] = id;
    }

    return map;
  }

  Component.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    vehicleId = map["vehicleId"];
    name = map["name"];
    iconURL = map["iconURL"];
    startMileage = map["startMileage"];
    mileageLifespan = map["mileageLifespan"];
  }
}
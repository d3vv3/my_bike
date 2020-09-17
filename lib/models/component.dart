class Component {

  // Attributes
  int id;
  int vehicleId;
  String name;
  String iconURL;
  int mileageLifeSpan;

  // Constructor
  Component({this.id, this.vehicleId, this.name, this.iconURL, this.mileageLifeSpan});

  // Methods
  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      "vehicleId": vehicleId,
      "name": name,
      "iconURL": iconURL,
      "mileageLifeSpan": mileageLifeSpan,
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
    mileageLifeSpan = map["mileageLifeSpan"];
  }
}
class DateModel {
  //define schema
  final int? id;
  final String dateText;

  DateModel({this.id, required this.dateText});

  //convert json data to DateModel instance
  factory DateModel.fromMap(Map<String, dynamic> json) {
    return DateModel(id: json["id"], dateText: json["dateText"]);
  }

  //convert DateModel instance to json 
  Map<String, dynamic> toMap() => {"id": id, "dateText": dateText};
}

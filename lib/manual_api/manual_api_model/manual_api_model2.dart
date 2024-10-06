class ManualApiModel2{
  String? name;
  String? qualification;
  String? city;
  // This is a constructor.
  ManualApiModel2({this.name, this.qualification, this.city});
  // This is factory constructor.
  factory ManualApiModel2.fromJson(Map<String, dynamic> parsedJson){
    return ManualApiModel2(
      name: parsedJson["Name"],
      qualification: parsedJson["Qualification"],
      city: parsedJson["City"],
    );
  }
}
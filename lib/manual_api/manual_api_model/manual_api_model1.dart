import 'manual_api_model2.dart';
import 'manual_api_model3.dart';
class ManualApiModel1{
  String? name;
  String? rollNo;
  String? degree;
  List? skills;
  ManualApiModel2? manualApiModel2; // This is instance or object of model class 2.
  List<ManualApiModel3?>? companies; // This is instance and object of List-Map model class 3.


  // This is a constructor.
  ManualApiModel1({this.name, this.rollNo, this.degree, this.skills, this.manualApiModel2, this.companies});

  // This is a factory constructor.
  factory ManualApiModel1.fromJson(Map<String, dynamic> parsedJson){
  // This is very important below these two line and kindly recommend try this code again and again.
  // This is trigger when List_Of_Map occur.
  List list = parsedJson["Companies"] as List<dynamic>;
  List<ManualApiModel3> newList = list.map((e) => ManualApiModel3.fromJson(e)).toList();

    return ManualApiModel1(
      name: parsedJson["Name"],
      rollNo: parsedJson["RollNo"],
      degree: parsedJson["Degree"],
      skills: parsedJson["Skills"],
      manualApiModel2: ManualApiModel2.fromJson(parsedJson["Attributes"]),
      companies: newList
    );
  }
}
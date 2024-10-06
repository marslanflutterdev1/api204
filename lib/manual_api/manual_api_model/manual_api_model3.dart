class ManualApiModel3 {
  int? no;
  String? company;

  // This is a constructor.
  ManualApiModel3({this.no, this.company});

  // This is a factory constructor.
  factory ManualApiModel3.fromJson(Map<String, dynamic> parsedJson){
    return ManualApiModel3(
      no: parsedJson["No."],
      company: parsedJson["Company"]
    );
  }

}
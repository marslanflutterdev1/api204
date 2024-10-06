import 'dart:convert';
import 'package:api204/manual_api/manual_api_model/manual_api_model1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManualApiUi1 extends StatelessWidget {
const ManualApiUi1({super.key});

Future<ManualApiModel1> loadJson()async{
    var loadJsonFromFolder =await rootBundle.loadString("lib/manual_api/manual_api_json/manual_api_json1.json");
    var jsonDecode =await json.decode(loadJsonFromFolder);
    ManualApiModel1 manualApiModel1 = ManualApiModel1.fromJson(jsonDecode);
    debugPrint(jsonDecode.toString());
    debugPrint(manualApiModel1.name.toString());
    return manualApiModel1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manual API 1")),
      body: FutureBuilder(
          future: loadJson(),
          builder: (BuildContext context, AsyncSnapshot<ManualApiModel1> asyncSnapshot){

            // This is trigger when waiting state.
            if(asyncSnapshot.connectionState == ConnectionState.waiting){
              return Scaffold(
                body:Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    strokeWidth: 4,
                  ),
                ),
              );
            }
            // This is trigger when error occur.
            if(asyncSnapshot.hasError){
              debugPrint(asyncSnapshot.error.toString());
              return Scaffold(
                body:Center(
                  child: Text(asyncSnapshot.error.toString(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.red,)),
                ),
              );

            }
            // At the end this is running.
            return SingleChildScrollView(
              child: Column(
                children: [
                  reuseText(text: "Profile"),
                  buildContainer(context: context,text: '${asyncSnapshot.data!.name}'),
                  buildContainer(context: context,text: '${asyncSnapshot.data!.rollNo}'),
                  buildContainer(context: context,text: '${asyncSnapshot.data!.degree}'),
                  reuseText(text: "Skills"),
                  ...List.generate(asyncSnapshot.data!.skills!.length,
                      (int? index){
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(10)),
                          child:  Center(child: Text("${asyncSnapshot.data!.skills![index!]}")),
                        );
                      }
                  ),
                  reuseText(text: "Attributes"),
                  buildContainer(context: context,text: '${asyncSnapshot.data!.manualApiModel2!.name}'),
                  buildContainer(context: context,text: '${asyncSnapshot.data!.manualApiModel2!.qualification}'),
                  buildContainer(context: context,text: '${asyncSnapshot.data!.manualApiModel2!.city}'),
                  reuseText(text: "Companies"),
                  ...List.generate(asyncSnapshot.data!.companies!.length,
                          (int? index){
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(10)),
                          child:  Center(child: Text("${asyncSnapshot.data!.companies![index!]!.no}  : ${asyncSnapshot.data!.companies![index]!.company}")),
                        );
                      }
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
  // This is reuse text for separated.
  Center reuseText({String? text}) {return Center(child: Text("$text",style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),);}
  // This is reuse-container for show text form api.
  Container buildContainer({required BuildContext context, String? text}) {
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(10)),
                  child:  Center(child: Text("$text")),
    );
  }
}



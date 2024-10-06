import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../placeholder_api_model/PlaceholderManualApiModelApiEx2.dart';

class PlaceholderManualApiUiEx2 extends StatefulWidget {
  const PlaceholderManualApiUiEx2({super.key});

  @override
  State<PlaceholderManualApiUiEx2> createState() => _PlaceholderManualApiUiEx2State();
}

class _PlaceholderManualApiUiEx2State extends State<PlaceholderManualApiUiEx2> {

  String? url = "https://jsonplaceholder.typicode.com/photos";
  List<PlaceholderManualApiModelEx2> emptyList = [];
  Future<List<PlaceholderManualApiModelEx2>> getPlaceholderManualApiModelFunEx2()async{
    http.Response response = await http.get(Uri.parse(url!));
    var decodeData = jsonDecode(response.body);
    if(response.statusCode == 200){
      for(Map<String, dynamic> i in decodeData){
        PlaceholderManualApiModelEx2 placeholderManualApiModelEx2 = PlaceholderManualApiModelEx2(id: i["id"], url: i["url"]);
        emptyList.add(placeholderManualApiModelEx2);
      }
      print(emptyList.toString());
      return emptyList;
    }
    print(emptyList);
   return emptyList;

  }
  @override
  Widget build(BuildContext context) {
    getPlaceholderManualApiModelFunEx2();

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Manual API UI Ex 2"),
      ),
      body:FutureBuilder(
        future: getPlaceholderManualApiModelFunEx2(),
        builder: (BuildContext context, AsyncSnapshot<List<PlaceholderManualApiModelEx2>> snapshot) {
          // This is trigger when occur error.
          if(snapshot.hasError){
            return Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Theme.of(context).secondaryHeaderColor.withGreen(10),
              body: Expanded(
                child: Center(
                  child: Text("${snapshot.error}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),
            );
          }
          // This is trigger when occur waiting stage._
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Theme.of(context).secondaryHeaderColor.withGreen(10),
              body: const Center(
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4,)
              ),
            );
          }
          return ListView.builder(
              itemCount: emptyList.length,
              itemBuilder: (BuildContext context, int? index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child:CircleAvatar(backgroundImage:NetworkImage(emptyList[index!].url.toString()))),
                        Center(child: Text(emptyList[index].id.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                      ],
                    ),
                  )
                );
              }
          );
        },

      )
    );
  }
}

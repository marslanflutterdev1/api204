import 'dart:convert';
import 'package:api204/placeholder_api/placeholder_api_model/PlaceholderApiModelEx1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlaceholderApiUiEx1 extends StatefulWidget {
  const PlaceholderApiUiEx1({super.key});

  @override
  State<PlaceholderApiUiEx1> createState() => _PlaceholderApiUiEx1State();
}

class _PlaceholderApiUiEx1State extends State<PlaceholderApiUiEx1> {
  // This is variables and methods declare.
  String url = "https://jsonplaceholder.typicode.com/posts";
  List<PlaceholderApiModelEx1> emptyList = [];
  Future<List<PlaceholderApiModelEx1>> getPlaceholderApiFunEx1() async {
    http.Response response = await http.get(Uri.parse(url));
    var decodeData = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in decodeData) {
        emptyList.add(PlaceholderApiModelEx1.fromJson(i as Map<String, dynamic>));
      }
        return emptyList;
    }
    return emptyList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placeholder API UI1"),
      ),
   body: FutureBuilder(
     future: getPlaceholderApiFunEx1(),
     builder: (BuildContext context, AsyncSnapshot<List<PlaceholderApiModelEx1>> snapshot) {
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
       // This is trigger when occur waiting stage.
       if(snapshot.connectionState == ConnectionState.waiting){
         return Scaffold(
           extendBodyBehindAppBar: true,
           backgroundColor: Theme.of(context).secondaryHeaderColor.withGreen(10),
           body: const Center(
             child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4,)
           ),
         );
       }
       // At the end this is trigger.
       return ListView.separated(
           itemCount: emptyList.length,
           itemBuilder: (BuildContext context, int? index){
             return Expanded(
               child: Container(
                 margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                 decoration: BoxDecoration(
                   color: Theme.of(context).secondaryHeaderColor.withGreen(10),
                   borderRadius: BorderRadius.circular(10)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("ID: ${emptyList[index!].id}", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       Text("User ID: ${emptyList[index].userId}", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       Text("Title: ${emptyList[index].title}", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       Text("Body: ${emptyList[index].body}", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                     ],

                   ),
                 ),
               ),
             );
           },
           separatorBuilder: (BuildContext context, int? index){
             return Divider(
               height: 4,
               thickness: 2,
               color: Theme.of(context).secondaryHeaderColor,
             );
           }
       );
     },

   ),
    );
  }
}

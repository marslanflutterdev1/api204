import 'dart:convert';
import 'package:api204/post_api/post_api_model/PostAPIModel1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApiUi1 extends StatefulWidget {
   const PostApiUi1({super.key});

  @override
  State<PostApiUi1> createState() => _PostApiUi1State();
}

class _PostApiUi1State extends State<PostApiUi1> {
  // Declaration of variables and functions.
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  PostApiModel1? user;
  Future<PostApiModel1> postAPIFun({String? name, String? job}) async{
    String url = "https://reqres.in/api/users";
    http.Response response = await http.post(Uri.parse(url), body: {"name":name, "job":job});
    var decodeData = await jsonDecode(response.body);
    PostApiModel1 postApiModel1 = PostApiModel1.fromJson(decodeData);
    return postApiModel1;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Post API Ui1"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    style:const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).secondaryHeaderColor.withGreen(1),
                      border:const OutlineInputBorder(borderSide: BorderSide.none,),
                      hintText: "Enter Name",
                      hintStyle:const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: jobController,
                    style:const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).secondaryHeaderColor.withGreen(1),
                      border:const OutlineInputBorder(borderSide: BorderSide.none,),
                      hintText: "Enter Job",
                      hintStyle:const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: ()async{
                     try{
                       final data = await postAPIFun(name: nameController.text.trim().toString(), job: jobController.text.trim().toString(),);
                      setState((){
                         user =  data;
                      });
                     }catch(e){
                       Scaffold(
                         backgroundColor: Theme.of(context).secondaryHeaderColor.withGreen(150),
                         body: const Center(
                           child: CircularProgressIndicator(color: Colors.white,strokeWidth: 4,),
                         ),
                       );
                     }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor.withGreen(10), borderRadius: BorderRadius.circular(4),),
                      child:const Center(child:  Text("Button",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  user == null ? Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor.withGreen(10),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child:const Center(child:CircularProgressIndicator(strokeWidth: 4,color: Colors.white,)),
                  ): Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor.withGreen(10),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(child:Column(
                      children: [
                        Center(child:  Text("Get Data",textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).secondaryHeaderColor.withBlue(1), fontSize: 25,fontWeight: FontWeight.bold),)),
                        Center(child:  Text("ID :  ${user!.id}",textAlign: TextAlign.center, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        Center(child:  Text("Name :  ${user!.name}", textAlign: TextAlign.center,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        Center(child:  Text("Job :  ${user!.job}",textAlign: TextAlign.center,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        Center(child:  Text("Created At :  ${user!.createdAt}",textAlign: TextAlign.center,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

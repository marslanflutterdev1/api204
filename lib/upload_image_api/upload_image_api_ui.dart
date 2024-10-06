import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageApiUi extends StatefulWidget {
  const UploadImageApiUi({super.key});

  @override
  State<UploadImageApiUi> createState() => _UploadImageApiUiState();
}

class _UploadImageApiUiState extends State<UploadImageApiUi> {
  // Methods & Variables.
  File? image;
 ImagePicker imagePicker = ImagePicker();
 Future<dynamic> uploadImage({final byte,String? fileName})async{
  var request = http.MultipartRequest("POST",Uri.parse("https://api.escuelajs.co/api/v1/files/upload"));
  var multiPartFile = http.MultipartFile(
                  "file",
                  http.ByteStream.fromBytes(byte),
                  byte.length,
                  filename: fileName,
                );
  request.files.add(multiPartFile);
  final response = await request.send();
  if(response.statusCode == 201){
   var data = await response.stream.bytesToString();
   var decodeData = await jsonDecode(data);
   return decodeData;
  }else{
    return null;
  }
  

 }
  Future<dynamic>  pickImageFun()async{
  XFile? pickImageFileFromGallery  = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 80);
  if(pickImageFileFromGallery != null){
    setState(() {
      image = File(pickImageFileFromGallery.path);
      debugPrint("Image Successfully Found From Gallery");
    });
  }else{
    setState(() {
      debugPrint("Image Not Found From Gallery");
    });
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Upload Image"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                pickImageFun();
              },
              child: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor.withGreen(10),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:image != null ? Center(child: ClipRRect(borderRadius: BorderRadius.circular(10) ,child: Image.file(image!.absolute, width: 300,height: 200,fit: BoxFit.fill,)),) : const Center(child:  Text("Click Pick Image",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
           const SizedBox(height: 50,),
            ElevatedButton(onPressed: ()async{
              if(image != null){
           final bytes = await image!.readAsBytes();
            final fileName = image!.path;
            uploadImage(
             byte: bytes,
             fileName: fileName,
           );
            debugPrint("Successfully Upload Image");
              }else{
                debugPrint("Not Upload Image");
              }
            }, child: const Text("Upload Image",style: TextStyle(color: Colors.black,fontSize: 30),))
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class MYSignModel extends StatefulWidget {
  static String routeName = "/MYSignModel";
  
  const MYSignModel({Key? key}) : super(key: key);

  @override
  State<MYSignModel> createState() => _MYSignModelState();
}

class _MYSignModelState extends State<MYSignModel> {
  File? image;
  bool? isLoading = false;
  String message="";
  final picker=ImagePicker();
  MYSignModel({required File image}){
    this.image=image;
  }
  Future getImage() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    if(pickedFile != null){
        image=File(pickedFile.path);
        setState(() {
         
        });
    }else{print('no image selected');}
     }

    Future<void> uploadImage()async{
      final url=Uri.parse("https://851e-154-176-181-62.eu.ngrok.io/upload");
      var request= http.MultipartRequest("POST",url);
      final headers={"Content-type":"multipart/from-data"};


      //var Multipart=new http.MultipartFile('image', image!.readAsBytes().asStream(), image!.lengthSync(),filename: image!.path.split("/").last);

      request.files.add(http.MultipartFile('image', image!.readAsBytes().asStream(), image!.lengthSync(),filename: image!.path.split("/").last));
      //var stream =new http.ByteStream(image!.openRead());
      //stream.cast();
      //var length= await image!.length();

      
      
      request.headers.addAll(headers);
      //request.fields['image'] = 'static image';
      

      final  response= await request.send();
      print(response.statusCode);
      http.Response res=await http.Response.fromStream(response);
      final resJson=jsonDecode(res.body);
      message=resJson['message'];
      print(message);
      setState(() {
        
      });
  
    }




    //dialoge 
    Future opencamer()async{
      var picture=await picker.pickImage(source: ImageSource.camera , imageQuality: 80);
      if(picture != null){
        image=File(picture.path);
        setState(() {
         
        });
    }else{print('no image selected');}
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image==null? Text('please pick an image'):
            Container(height: 200,width: 200, child: Image.file(image!)),
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.blue)
              ),
              onPressed: getImage
              , icon: Icon(Icons.photo_album,color: Colors.white,)
              , label: Text("get image ",style: TextStyle(
                color: Colors.white
              ),)),
              TextButton.icon(
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.blue)
              ),
              onPressed: uploadImage
              , icon: Icon(Icons.upload_file,color: Colors.white,)
              , label: Text("Upload ",style: TextStyle(
                color: Colors.white
              ),)),
              TextButton.icon(
                onPressed: opencamer,
                 icon: Icon(Icons.camera_enhance),
                label: Text('open camera')), 
              Center(child: Text(message),)

          ],
        ),
      ),
    );
  }


  }

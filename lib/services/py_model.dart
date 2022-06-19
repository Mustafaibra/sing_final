import 'dart:convert';
import 'dart:ffi';
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
  String data = "";

  File? image;
  bool? isLoading = false;
  String message = "";
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  Future<void> uploadImage() async {
    final url = Uri.parse("https://38b9-197-35-110-139.eu.ngrok.io/upload");
    var request = http.MultipartRequest("POST", url);
    final headers = {"Content-type": "multipart/from-data"};

    //var Multipart=new http.MultipartFile('image', image!.readAsBytes().asStream(), image!.lengthSync(),filename: image!.path.split("/").last);

    request.files.add(http.MultipartFile(
        'image', image!.readAsBytes().asStream(), image!.lengthSync(),
        filename: image!.path.split("/").last));
    //var stream =new http.ByteStream(image!.openRead());
    //stream.cast();
    //var length= await image!.length();

    request.headers.addAll(headers);
    //request.fields['image'] = 'static image';

    final response = await request.send();
    print(response.statusCode);
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];
    print(message);
    setState(() {
      data = data + message;
      
    });
  }

  //dialoge
  Future opencamer() async {
    var picture = await picker.pickImage(source: ImageSource.camera);
    if (picture != null) {
      image = File(picture.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 242, 247, 1),
        body: ListView(children: [
          Card(
            color: const Color.fromRGBO(36, 36, 62, 1),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Now You Can use Your Camera to Make a Sign language detection.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            image == null
                ? Text(
                    'Please Pick an image',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    height: size.height / 2,
                    width: 400,
                    child: Image.file(
                      image!,
                      width: 300,
                    )),
            TextButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(36, 36, 62, 1))),
              onPressed: opencamer,
              icon: Icon(Icons.camera_enhance_outlined),
              label: Text('Take a photo From Camera',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(36, 36, 62, 1))),
                  onPressed: getImage,
                  icon: Icon(
                    Icons.photo_album,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Image From Gallery ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 2, right: 2),
                  child: TextButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: uploadImage,
                      icon: Icon(
                        Icons.upload_file,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Upload ",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 2, right: 2),
                  child: TextButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[800])),
                      onPressed: () {
                        data = "";
                        setState(() {
                          data = "";
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Clear Text ",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Center(
                    child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [Text("Your Text is : ",style: TextStyle(color: Colors.white, fontSize: 16), ),
                        Text(
                          data.isNotEmpty ? data.substring(0,1)+data.substring(1,data.length).toLowerCase():data,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  color: const Color.fromRGBO(36, 36, 62, 1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      if (data != null && data.length > 0) {
                        setState(() {
                          data = data.substring(0, data.length - 1);
                        });
                      }
                    },
                    icon: Icon(Icons.backspace_outlined),
                    color: Colors.red[800]),

                  
              ],
            ),
          ]),
        ]));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sing_final/screens/category_screen.dart';
import 'package:sing_final/screens/chat/chat_logic.dart';
import 'package:sing_final/services/py_model.dart';

class StartingTany extends StatefulWidget {
  const StartingTany({Key? key}) : super(key: key);

  @override
  State<StartingTany> createState() => _StartingTanyState();
}

class _StartingTanyState extends State<StartingTany> {
  File? image;
  final picker=ImagePicker();
  Future opencamer()async{
      var picture=await picker.pickImage(source: ImageSource.camera , imageQuality: 80);
      if(picture != null){
        image=File(picture.path);
        setState(() {
         
        });
    }else{print('no image selected');}
    }
  String personType1 = 'Deaf';
  String personType2 = 'Normal';
  Widget BuildCate(
    double height,
    double width,
    String imageUrl,
    String title,
    String description,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200)
      ),
      height: 250,
      child: Stack(
        children: [
          Positioned(
            top: 35,
            left: 20,
            child: Material(
              
              child: Container(
                height: 230,
                width: width *.9,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 0,
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.grey.withOpacity(1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 200,
            child: Container(
              height: 160,
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 147, 54, 134),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 10, 74, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  color: Color.fromARGB(255, 147, 54, 134)),
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
                    left: 0,
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 20,
                    child: Text(
                      "Chooose an Option",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 147, 54, 134),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 25),
                    height: 180,
                    width: 260,
                    padding: EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                      right: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 147, 54, 134),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromARGB(255, 147, 54, 134)
                                .withOpacity(0.3),
                            offset: new Offset(-10.0, 0.0),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'We aim to break the barrier',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 25),
                    height: 150,
                    width: 250,
                    padding: EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                      right: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 147, 54, 134),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromARGB(255, 147, 54, 134)
                                .withOpacity(0.3),
                            offset: new Offset(-10.0, 0.0),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Communicate easily',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 25),
                    height: 180,
                    width: 260,
                    padding: EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                      right: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 147, 54, 134),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromARGB(255, 147, 54, 134)
                                .withOpacity(0.3),
                            offset: new Offset(-10.0, 0.0),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'No room for discrimination',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 25),
                    height: 150,
                    width: 250,
                    padding: EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                      right: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 147, 54, 134),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromARGB(255, 147, 54, 134)
                                .withOpacity(0.3),
                            offset: new Offset(-10.0, 0.0),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Communicate easily',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //first
            InkWell(
              //rabt
              onTap: () {
                  Navigator.pushNamed(context, SpeechScreen.routeName);
              },
              child: BuildCate(
                height,
                width,
                'assets/Chat1.png',
                'Voice Chat',
                'Say what you want to say!',
              ),
            ),
            //second
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => categoriesState(personType1),
                    ),
                  );
              },
              child: BuildCate(
                height,
                width,
                'assets/signs.png',
                'Sign Language',
                'Translation of sign language',
              ),
            ),
            //
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => categoriesState(personType2),
                    ),
                  );
              },
              child: BuildCate(
                height,
                width,
                'assets/words.png',
                'Word to Sign Language',
                'translation of Words',
              ),
            ),
            InkWell(
              onTap: () {
                opencamer();
                Navigator.pushNamed(context, MYSignModel.routeName);
              },
              child: BuildCate(
                height,
                width,
                'assets/Chat1.png' /*need to fnide image*/,
                "Sign Language recognition",
                'images can be translated!',
              ),
            )
          ],
        ),
      ),
    );
  }
}
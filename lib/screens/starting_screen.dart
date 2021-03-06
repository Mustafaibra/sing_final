// ignore_for_file: prefer_const_constructors, file_names


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:sing_final/screens/chat/chat_logic.dart';


import 'category_screen.dart';

class getStarted extends StatefulWidget {
  const getStarted({Key? key}) : super(key: key);
  static String routeName = "/getStarted";
  @override
  _getStartedState createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  @override
  Widget build(BuildContext context) {
    String personType1 = 'Deaf';
    String personType2 = 'Normal';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(113, 48, 148, 1),
        ),
        backgroundColor: Color.fromRGBO(36, 36, 62, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SpeechScreen.routeName);
                },
                child: GFCard(
                  color: Color(0xFF713094),
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(3),
                  elevation: 3,
                  height: 195,
                  boxFit: BoxFit.cover,
                  //titlePosition: GFPosition.start,
                  //showOverlayImage: true,
                  //imageOverlay: AssetImage('assets/Chat1.png'),

                  title: GFListTile(
                    title: Center(
                      child: Text(
                        'Voice Chat',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  showImage: true,
                  image:
                      Image.asset('assets/Chat1.png', width: 110, height: 110),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => categoriesState(personType1),
                    ),
                  );
                },
                child: GFCard(
                  color: Color(0xFF713094),
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(3),
                  elevation: 3,
                  height: 195,
                  boxFit: BoxFit.cover,
                  //titlePosition: GFPosition.start,
                  //showOverlayImage: true,
                  //imageOverlay: AssetImage('assets/img1.png'),

                  title: GFListTile(
                    title: Center(
                      child: Text(
                        'Sign language',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  showImage: true,
                  image:
                      Image.asset('assets/img1.png', width: 110, height: 110),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => categoriesState(personType2),
                    ),
                  );
                },
                child: GFCard(
                  color: Color(0xFF713094),
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(3),
                  elevation: 3,
                  height: 195,
                  boxFit: BoxFit.cover,
                  //showOverlayImage: true,
                  //imageOverlay: AssetImage('assets/img.jpg'),

                  title: GFListTile(
                    title: Center(
                      child: Text(
                        'Words to Sign language',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                    ),
                  ),
                  showImage: true,
                  image: Image.asset('assets/img.png', width: 110, height: 110),
                ),
              ),
            ],
          ),
        ));
  }
}

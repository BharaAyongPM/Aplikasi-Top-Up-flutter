import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_login_ui/main.dart';










class about extends StatefulWidget {
  static const route = "/home";

  @override
  _aboutState createState() => _aboutState();
}


class _aboutState extends State<about> {
  bool isInit = true;
  bool isLoading = false;
  get children => null;


  @override
  Widget build(BuildContext context) {
    var child;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: (){}
          ),
          title: Text("VIGENESIA"),
        ),

        backgroundColor: Colors.purple[100],
     body: Container(
        child: Container(
          child: Column(
                children:  <Widget> [
    
                 
                  Image(height: 200, width: 500, image: NetworkImage("https://imgur.com/CRBnYsA.jpg")),
                  Text('--------------------------------- '),
                  Text('--------------------------------- '),
                  Text('VIGENESIA '),
                  Text('PROYEK APLIKASI MENGGUNAKAN FLUTTER'),
                 Text('TEKNOLOGI WEB SERVICE'),
                 Text('UNIVERSITAS BINA SARANA INFORMATIKA'),
                 Text('--------------------------------- '),
                  Text('Bhara Ayong Purna Mustika - 15200294 '),
                  Text('Mochamad Rizki Teguh Esa Pratantio - 15200104' ),
                 Text('Alfhi Aryansyah - 15200101 '),
                 Text('Mohammad Rizky Andrianto - 15200220 '),
                 Text('Ahmad Apriya Hafiz - 15200189 ' ),
                 Text('--------------------------------- '),
                 Text('PRODI ILMU KOMPUTER  '),
                 //Image(height: 200, width: 500, image: NetworkImage("https://imgur.com/7MFOJiz")),
                 
                 
                
                
              
              
              
            ],
          ),
          
        ),
          

              
      
      )
  
     
      
    );
    
  }

}


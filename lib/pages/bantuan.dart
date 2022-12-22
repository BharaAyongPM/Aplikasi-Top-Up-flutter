import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topup/main.dart';



import '../providers/auth.dart';
import 'package:url_launcher/url_launcher.dart';



 final List<String> imageList = [
 'https://imgur.com/eUThYgj.jpg',
  'https://imgur.com/Akp3TYo.jpg',
  'https://imgur.com/TgbNe7W.jpg',
  'https://imgur.com/1ZnnrvR.jpg',
  'https://imgur.com/qSopdyN.jpg',
  'https://imgur.com/U0tand6.jpg'
];

class bantuan extends StatefulWidget {
  static const route = "/home";

  @override
  _bantuanState createState() => _bantuanState();
}


class _bantuanState extends State<bantuan> {
  bool isInit = true;
  bool isLoading = false;
  get children => null;

  

  

  

  void launchWhatsapp ({@required number, @required message}) async{
    var text;
    String url ="https://api.whatsapp.com/send?phone=6289620691733&text=Halo!%0ASaya%20butuh%20Bantuan,%20admin%20bisa%20bantu?";

    await canLaunch(url) ? launch(url) : print("tidak bisa membuka whatsapp");
  }

 



  @override
  Widget build(BuildContext context) {
    var child;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => Provider.of<Auth>(context, listen: false).logout(),
        ),
        title: Text("GENPACT ID"),
        
        
  
      ),
      backgroundColor: Colors.blue[100],
     body: Container(
        child: Container(
          child: Column(
                children:  <Widget> [
    
                 
                  Image(height: 200, width: 500, image: NetworkImage("https://imgur.com/CRBnYsA.jpg")),
                  Text('--------------------------------- '),
                  Text('--------------------------------- '),
                  Text('BUTUH BANTUAN?'),
                  Text('LAPOR MASALAH'),
                 Text('SILAHKAN KLIK TOMBOL UNTUK MENUJU KE WHATSAPP ADMIN'),
                 Text('--------------------------------- '),
                  Text('TERIMA KASIH ATAS DUKUNGAN ANDA '),
                  Text('KAMI AKAN MELAYANI ANDA SEGENAP HATI' ),
                 Text('--------------------------------- '),
                 
                 
                RaisedButton(
                  onPressed: (){
                    launchWhatsapp();
                  
          
                  },),
                  Text("BUKA WHATSAPP"),
                
              
              
              
            ],
          ),
          
        ),
          

              
      
      )
  
     
      
    );
    
  }

}


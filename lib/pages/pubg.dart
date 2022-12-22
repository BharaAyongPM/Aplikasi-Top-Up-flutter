import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topup/main.dart';

import '../providers/auth.dart';
import 'package:url_launcher/url_launcher.dart';

//import '../pages/add_product_page.dart';
//import '../widgets/product_item.dart';

 final List<String> imageList = [
 'https://imgur.com/eUThYgj.jpg',
  'https://imgur.com/Akp3TYo.jpg',
  'https://imgur.com/TgbNe7W.jpg',
  'https://imgur.com/1ZnnrvR.jpg',
  'https://imgur.com/qSopdyN.jpg',
  'https://imgur.com/U0tand6.jpg'
];

class pubg extends StatefulWidget {
  static const route = "/home";

  @override
  _pubgState createState() => _pubgState();
}


class _pubgState extends State<pubg> {
  bool isInit = true;
  bool isLoading = false;
  get children => null;

  

  

  

  void launchWhatsapp ({@required number, @required message}) async{
    var text;
    String url ="https://api.whatsapp.com/send?phone=6289620691733&text=Halo!%0ASaya%20mau%20Top UP%20PUBGM,%20apakah%20bisa%20dibantu?";

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
    
                 
                  Image(height: 200, width: 500, image: NetworkImage("https://imgur.com/uhkS4BY.jpg")),
                  Text('--------------------------------- '),
                  Text('--------------------------------- '),
                  Text('TOP UP UC PUBG MOBILE'),
                  Text('HANYA VIA UID SAJA, TANPA HARUS LOGIN !!!'),
                 Text('proses CEPAT 5-10 MENIT SAJA'),
                 Text('--------------------------------- '),
                  Text('💎60 = Rp12.000 '),
                  Text('💎300+30 = Rp60.000' ),
                 Text('💎980+110 = Rp180.000 '),
                 Text('💎1980+260 = Rp390.000 '),
                 Text('💎3280+600 = Rp600.000 ' ),
                 Text('💎6480+1600 = Rp1.200.000 '),
                 Text('--------------------------------- '),
                 Text('LEGAL WITH GOOGLE PLAY INVOICE 🔥 '),
                 Text('Pembayaran via :  '),
                 Text('Dana, ShopeePay & OVO '),
                 Text('--------------------------------- '),
                 Text('Untuk Lebih lanjut Silahkan Klik tombol di bawah '),
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


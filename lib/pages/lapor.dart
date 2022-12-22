import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_login_ui/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';

import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_login_ui/main.dart';
import 'login_page.dart';





//import '../pages/add_product_page.dart';
//import '../widgets/product_item.dart';



class lapor extends StatefulWidget {


  @override
  _laporState createState() => _laporState();
}


class _laporState extends State<lapor> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  bool isInit = true;
  bool isLoading = false;
  get children => null;
  TextEditingController email = TextEditingController();
  TextEditingController motivasi = TextEditingController();
  TextEditingController iduser = TextEditingController();


  Future lapor() async {
    var url ="http://192.168.133.62/login/motivasi.php";
    var response = await http.post(
        Uri.parse(url),body:{
      "email" : email.text,
      "motivasi" : motivasi.text,
      "iduser" : iduser.text,


    });
    var data = json.decode(response.body);
    if (data == "Error" ) {
      Fluttertoast.showToast(
          msg: "user sudah ada",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "registrasi sukses",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );


    }
  }







  void launchWhatsapp ({@required number, @required message}) async{
    var text;
    String url ="https://api.whatsapp.com/send?phone=6289620691733&text=Halo!%0ASaya%20butuh%20Bantuan,%20admin%20bisa%20bantu?";
    await canLaunch(url) ? launch(url) : print("tidak bisa membuka whatsapp");
  }







  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'VIGENESIA',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Masukan Saran',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  controller: email,
                                  decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) {
                                    if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  controller: motivasi,
                                  decoration: ThemeHelper().textInputDecoration('saran', 'masukan saran'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  controller: iduser,
                                  decoration: ThemeHelper().textInputDecoration('iduser', 'masukan iduser'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      "KIRIM".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    lapor();


                                  },
                                ),
                              ),


                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}
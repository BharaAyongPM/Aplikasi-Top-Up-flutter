
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


import 'profile_page.dart';

class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  TextEditingController nama = TextEditingController();
  TextEditingController profesi = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future register() async {
    var url ="http://192.168.133.62/login/register.php";
    var response = await http.post(
        Uri.parse(url),body:{
      "nama" : nama.text,
      "profesi" : profesi.text,
      "email" : email.text,
      "password" : password.text,

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

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.videogame_asset,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextField(
                            controller: nama,
                            decoration: ThemeHelper().textInputDecoration('Name', 'Enter your first name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),

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
                        SizedBox(height: 30,),
                        Container(
                          child: TextField(
                            controller: profesi,
                            decoration: ThemeHelper().textInputDecoration('Profesi', 'Enter your first name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              register();
                              LoginPage();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));

                            },
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text("atau masuk menggunakan sosial media",  style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus, size: 35,
                                color: HexColor("#EC2D2F"),),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Google Plus","You tap on GooglePlus social icon.",context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(width: 30.0,),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter, size: 23,
                                  color: HexColor("#FFFFFF"),),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Twitter","You tap on Twitter social icon.",context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(width: 30.0,),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook, size: 35,
                                color: HexColor("#3E529C"),),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Facebook",
                                          "You tap on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
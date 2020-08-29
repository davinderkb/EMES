import 'dart:convert';
import 'dart:ui';

import 'package:emes/userdata.dart';
import 'package:emes/util/constants.dart';
import 'package:emes/util/utility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{
  TextEditingController passwordController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController companyIdController = new TextEditingController();
  FocusNode passwordFocus = new FocusNode();
  FocusNode usernameFocus = new FocusNode();
  FocusNode companyIdFocus = new FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _isLoading = false;
  void inContact(TapDownDetails details) {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final userName = TextFormField(
      controller: userNameController,
      focusNode: usernameFocus,
      validator: (value) {
        if (value.isEmpty) {
          usernameFocus.requestFocus();
          return 'Username cannot be empty';
        } else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(userNameController.text)){
          usernameFocus.requestFocus();
          return 'Invalid email';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Username",
      ),
    );
    final companyId = TextFormField(
      controller: companyIdController,
      keyboardType: TextInputType.number,
      focusNode: companyIdFocus,
      validator: (value) {
        if (value.isEmpty) {
          companyIdFocus.requestFocus();
          return 'Company ID cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Company ID",
      ),
    );
    final passwordField = TextFormField(
      controller: passwordController,
      focusNode: passwordFocus,
      validator: (value) {
        if (value.isEmpty) {
          passwordFocus.requestFocus();
          return 'Password cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
      ),
      obscureText: _obscureText,
    );


    final loginButton = Material(
      borderRadius: BorderRadius.circular(16.0),

      color: Colors.blue,
      child: MaterialButton(
        minWidth: _width - 100,
        onPressed: () {
          FocusScope.of(context).unfocus();
          onLoginPress(context);
        },
        child: Text("SIGN IN", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
    ));

    final signUpButton = Material(
        borderRadius: BorderRadius.circular(16.0),

        color: Colors.white,
        child: MaterialButton(
          minWidth: _width - 100,
          onPressed: () {
            FocusScope.of(context).unfocus();
          },
          child: Text("SIGN UP", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue),),
        ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: _height > _width ? _height : _height * 2,
              width: _width,

              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(
                      width:  MediaQuery.of(context).size.width/2,
                      child: Image.asset('assets/images/logo_foreground.png'),
                    ),
                    Container(decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                    ),child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,4),
                      child: Text("Staff Login", style: TextStyle(color: Colors.grey),),
                    )),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(width: _width/1.2, child: userName),
                    ),
                    SizedBox(height: 8.0),
                    Stack(children: [
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(width: _width/1.2, child: passwordField),
                          ),
                        ],
                      ),
                      Positioned(
                        width: _width/.65 ,
                        top: MediaQuery.of(context).size.width * 0.05 ,
                        child: GestureDetector(
                          onTapDown: inContact,
                          onTapUp: outContact,
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.blue, size:30
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(width: _width/1.2, child: companyId),
                    ),
                    SizedBox(height: 16.0),
                    Container(height:54,width: _width/1.2,child: loginButton),
                    SizedBox(height: 8.0),
                    Container(height:54,
                        width: _width/1.2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(16.0))
                        ),
                        child: signUpButton),
                    SizedBox(height: 12.0),

                  ],
                ),
              ), /* add child content here */
            ),
            _isLoading? Positioned(
              top: MediaQuery.of(context).size.height/2 - 25,
              left: MediaQuery.of(context).size.width/2 - 25,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SpinKitRing(
                    lineWidth: 4.0,
                    color: Colors.blue,
                    size: 34,
                  ),
                ),
              ),
            ):SizedBox()
          ],
        ),
      ),
    );
  }

  void onLoginPress(BuildContext context) {
    if (_formKey.currentState.validate()) {
      getCompanyUrl(context);
    }

  }

  Future<void> getCompanyUrl(BuildContext context) async {
    FormData formData = new FormData.fromMap({
      "companyID": companyIdController.text.trim(),
    });
    setState(() {
      _isLoading = true;
    });
    var dio = Dio();
    var getCompanyUrl = 'http://emesau.com/api/get_info';
    dynamic response;
    try{
      response = await dio.post(getCompanyUrl, data: formData);
      if (response.statusCode ==200) {
        String companyUrl = response.toString();
        formData = new FormData.fromMap({
          "email": userNameController.text.trim(),
          "password": passwordController.text.trim(),
          "companyID": companyIdController.text.trim(),
        });
        response = await dio.post(companyUrl+ '/api/login', data: formData);
        if(response.statusCode==200){
          dynamic responseList = jsonDecode(response.toString());
          UserData user = UserData.fromJson(responseList["output"]);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        }
      } else {
        Utility.showAlertDialog(context, "Invalid Company ID", "Company ID not found !");
      }
      setState(() {
        _isLoading = false;
      });
    }catch(exception){
      Utility.showAlertDialog(context, "Authentication Failed", "Please provide correct details !!");
      setState(() {
        _isLoading = false;
      });
    }

  }
}

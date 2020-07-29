import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/blackBox.dart';

class ReportProblem extends StatefulWidget {
  @override
  _ReportProblem createState() => _ReportProblem();
}

class _ReportProblem extends State<ReportProblem> {
  String email = '';
  String name = '';
  String title = '';
  String description = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  SnackBar submitForm() {
    if (email.isNotEmpty &&
        name.isNotEmpty &&
        title.isNotEmpty &&
        description.isNotEmpty) {
      print(email);
      print(name);
      print(title);
      print(description);
      emailController.text = '';
      nameController.text = '';
      titleController.text = '';
      descriptionController.text = '';
//      setState(() {
//        email = '';
//        name = '';
//        title = '';
//        description = '';
//      });
      return SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          'Problem Reported',
          style: TextStyle(fontFamily: 'Gilroy SemiBold', fontSize: 17),
        ),
        duration: Duration(seconds: 3),
      );
    } else {
      return SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Please fill the form correctly',
          style: TextStyle(fontFamily: 'Gilroy SemiBold', fontSize: 17),
        ),
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor:
                blackBoxProvider.getDarkMode ? Colors.black : Colors.white,
            key: _scaffoldKey,
            appBar: AppBar(),
            body: Container(
              margin: EdgeInsets.only(top: 20),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: emailController,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email', border: OutlineInputBorder()),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: nameController,
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Name', border: OutlineInputBorder()),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: titleController,
                        onChanged: (val) {
                          setState(() {
                            title = val;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Problem Title',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: descriptionController,
                        onChanged: (val) {
                          setState(() {
                            description = val;
                          });
                        },
                        maxLines: 8,
                        maxLength: 500,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Problem Description',
                            alignLabelWithHint: true,
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        height: 90,
                        child: RaisedButton(
                          onPressed: () {
                            _scaffoldKey.currentState
                                .showSnackBar(submitForm());
                            var duration = const Duration(seconds: 2);
                            return new Timer(duration, () {
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontFamily: 'Gilroy Bold', fontSize: 20),
                          ),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ))
                  ],
                ),
              ),
            )));
  }
}

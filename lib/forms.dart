import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';
import 'package:gesture_automate/shared/MyCheckBox.dart';
import 'package:gesture_automate/shared/MyDatePicker.dart';
import 'package:gesture_automate/shared/MyRadioButton.dart';
import 'package:gesture_automate/shared/MyTextField.dart';
import 'package:gesture_automate/shared/Submission.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  _FormsState() {
    _selectedVal = _countrySizeList[0];
  }

  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
  bool _checkBox = false;
  GenderEnum _genderTypeEnum;
  final _countrySizeList = ["India", "US", "UK", "AUS", "Russia"];
  String _selectedVal = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: PathClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFF54B64),
                      Color(0xFFF78361),
                    ],
                    stops: [0.25, 0.75],
                  ),
                ),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            tooltip: 'Back',
                            color: Colors.white,
                            onPressed: () => Navigator.pop(context, false),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0.0, 0, 0.0),
                        child: Center(
                          child: Text(
                            "Forms",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ]),
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                        key: _formKey,
                        child: ListView(children: [
                          MyTextField(
                              keytext: 'first_Key',
                              myController: _firstController,
                              fieldName: "First Name",
                              myIcon: Icons.person,
                              prefixIconColor: Colors.red.shade300,
                              validatorText: "Enter First Name"),
                          SizedBox(height: 10.0),
                          MyTextField(
                              keytext: 'last_Key',
                              myController: _lastController,
                              fieldName: "Last Name",
                              myIcon: Icons.person,
                              prefixIconColor: Colors.red.shade300,
                              validatorText: "Enter Last Name"),
                          SizedBox(height: 10.0),
                          MyTextField(
                              keytext: 'email_Key',
                              myController: _emailController,
                              fieldName: "Email",
                              myIcon: Icons.person,
                              prefixIconColor: Colors.red.shade300,
                              validatorText: "Enter Email ID"),
                          SizedBox(height: 10.0),
                          MyDatePicker(),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              MyRadioButton(
                                keyText: 'male_Key',
                                title: GenderEnum.Male.name,
                                value: GenderEnum.Male,
                                selectedGenderType: _genderTypeEnum,
                                onChanged: (val) {
                                  setState(() {
                                    _genderTypeEnum = val;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              MyRadioButton(
                                keyText: 'female_Key',
                                title: GenderEnum.Female.name,
                                value: GenderEnum.Female,
                                selectedGenderType: _genderTypeEnum,
                                onChanged: (val) {
                                  setState(() {
                                    _genderTypeEnum = val;
                                  });
                                },
                              ),
                            ],
                          ),
                          DropdownButtonFormField(
                            key: ValueKey('drop_Key'),
                            value: _selectedVal,
                            items: _countrySizeList
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedVal = val as String;
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down_circle,
                              color: Colors.red,
                            ),
                            dropdownColor: Colors.red.shade50,
                            decoration: InputDecoration(
                                labelText: "Country",
                                prefixIcon: Icon(
                                  Icons.accessibility_new_rounded,
                                  color: Colors.red,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                          SizedBox(height: 10.0),
                          MyCheckBox(
                              keyText: 'check_Key',
                              checkBoxValue: _checkBox,
                              onChanged: (val) {
                                setState(() {
                                  _checkBox = val;
                                });
                              }),
                          SizedBox(height: 10.0),
                          OutlinedButton(
                            key: ValueKey('submit_Key'),
                            style: OutlinedButton.styleFrom(
                                minimumSize: Size(200, 50)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Submission();
                                }));
                              }
                            },
                            child: Text(
                              "Submit Form".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade300),
                            ),
                          )
                        ]))))
          ],
        ),
      ),
    );
  }
}

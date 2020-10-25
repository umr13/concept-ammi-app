import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Ammiv1/ui/router.dart' as router;

import '../main.dart';

class OnlineAppointment extends StatefulWidget {
  @override
  _OnlineAppointmentState createState() => _OnlineAppointmentState();
}

class _OnlineAppointmentState extends State<OnlineAppointment> {
  int _value = 1;
  int _valuec = 1;
  DateTime babyDateOfBirth = DateTime.now();

  final router.Router _router = router.Router.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _router.init();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.black,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(247, 203, 175, 1),
        title: Align(
            alignment: Alignment.center,
            child: Text(
              "Online Appointments",
              style: TextStyle(color: Colors.black, fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.w300),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 25, 8, 0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 5),
                    child: Text(
                      "What do you need?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Please Select one"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Eye Checkup"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Vaccinations"), value: 3),
                        DropdownMenuItem(child: Text("Online Consultation"), value: 4)
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          print(value);
                        });
                      }),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 30, 8, 5),
                    child: Text(
                      "Choose a Clinic?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  DropdownButton(
                      value: _valuec,
                      items: [
                        DropdownMenuItem(
                          child: Text("Please Select one"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("One Clinic"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Islamabad Clinic"), value: 3),
                        DropdownMenuItem(child: Text("Private Clinic"), value: 4)
                      ],
                      onChanged: (value) {
                        setState(() {
                          _valuec = value;
                          print(_valuec);
                        });
                      }),
                ],
              ),
            ),
            Container(
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 8, 5),
                      child: Text(
                        "Choose a Date",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 8, 5),
                      child: Icon(Icons.calendar_today),
                    ),
                  ],
                ),
                onTap: (){
                  setState(() {
                    _selectDate(context);
                  });
                },
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Container(
                  width: 100,
                  height: 40,
                  child: Center(
                      child: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
                  color: Colors.green[100],
                ),
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }


  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: babyDateOfBirth, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != babyDateOfBirth)
      setState(() {
        babyDateOfBirth = picked;
      });
  }

}

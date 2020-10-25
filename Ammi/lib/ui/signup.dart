import 'package:Ammiv1/constants.dart';
import 'package:Ammiv1/ui/home.dart';
import 'package:Ammiv1/ui/router.dart' as router;
import 'package:flutter/material.dart';
import 'package:Ammiv1/services/auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int currentPageNum = 1;
  int totalPages = 5;
  String email;
  String babyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: progressIndicator(),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 8,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/dadi-ammi.png'),
                ),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 5,
                child: Text(
                  'Please Enter your Email.',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              TextField(
                onChanged: (value) => email = value,
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 5,
                child: Text(
                  'Enter your Baby\'s Name.',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              TextField(
                onChanged: (value) => babyName = value,
              ),
              Spacer(),
              Flexible(
                flex: 3,
                child: RaisedButton(
                  color: COLORS.ACCENT_GREEN,
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) => SignupPage2(email: this.email, babyName: this.babyName));
                    Navigator.pushReplacement(context, route);
                  },
                  child: Text(
                    "Next",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget progressIndicator() {
    return Row(
      children: [
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 1 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 2 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 3 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 4 ? Colors.green : Colors.white),
        ),
      ],
    );
  }
}

class SignupPage2 extends StatefulWidget {
  final String email, babyName;
  SignupPage2({@required this.email, @required this.babyName});
  @override
  _SignupPage2State createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  int currentPageNum = 1;
  int totalPages = 4;
  DateTime babyDateOfBirth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: progressIndicator(),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 5,
                child: Image.asset('assets/images/baby.png'),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Flexible(
                      child: Text(
                        'When Was Your Baby Born?',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            _selectDate(context);
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${babyDateOfBirth.year}-${babyDateOfBirth.month}-${babyDateOfBirth.day}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: RaisedButton(
                        color: COLORS.ACCENT_GREEN,
                        onPressed: () {
                          // TODO: update babyDateOfBirth in firebase
                          Route route = MaterialPageRoute(
                              builder: (context) => SignupPage3(
                                    email: widget.email,
                                    babyName: widget.babyName,
                                    babyDateOfBirth: babyDateOfBirth,
                                  ));
                          Navigator.pushReplacement(context, route);
                        },
                        child: Text(
                          "Next",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

  Widget progressIndicator() {
    return Row(
      children: [
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 1 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 2 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 3 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 4 ? Colors.green : Colors.white),
        ),
      ],
    );
  }
}

class SignupPage3 extends StatefulWidget {
  final DateTime babyDateOfBirth;
  final String email;
  final String babyName;
  SignupPage3({@required this.email, @required this.babyName, this.babyDateOfBirth});
  @override
  _SignupPage3State createState() => _SignupPage3State();
}

class _SignupPage3State extends State<SignupPage3> {
  int currentPageNum = 2;
  int totalPages = 4;
  bool vaccinated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: progressIndicator(),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 5,
                child: Image.asset('assets/images/syringe.png'),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Flexible(
                      child: Text(
                        'Did you get your child vaccinated?',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: RaisedButton(
                        color: COLORS.ACCENT_RED,
                        onPressed: () {
                          setState(() {
                            //TODO: Store this in firebase
                            vaccinated = false;
                          });
                          Route route = MaterialPageRoute(
                            builder: (context) => SignupPage5(
                              email: widget.email,
                              babyName: widget.babyName,
                              babyDateOfBirth: widget.babyDateOfBirth,
                              vaccinated: false,
                              vaccinations: null,
                            ),
                          );
                          Navigator.pushReplacement(context, route);
                        },
                        child: Text(
                          "No",
                        ),
                      ),
                    ),
                    Spacer(),
                    Flexible(
                      child: RaisedButton(
                        color: COLORS.ACCENT_GREEN,
                        onPressed: () {
                          setState(() {
                            //TODO: Store this in firebase
                            vaccinated = true;
                          });
                          Route route = MaterialPageRoute(
                              builder: (context) => SignupPage4(
                                    email: widget.email,
                                    babyName: widget.babyName,
                                    babyDateOfBirth: widget.babyDateOfBirth,
                                    vaccinated: true,
                                  ));
                          Navigator.pushReplacement(context, route);
                        },
                        child: Text(
                          "Yes",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget progressIndicator() {
    return Row(
      children: [
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 1 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 2 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 3 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 4 ? Colors.green : Colors.white),
        ),
      ],
    );
  }
}

class SignupPage4 extends StatefulWidget {
  final String email;
  final String babyName;
  final DateTime babyDateOfBirth;
  final bool vaccinated;
  SignupPage4({this.babyDateOfBirth, this.vaccinated, @required this.email, @required this.babyName});
  @override
  _SignupPage4State createState() => _SignupPage4State();
}

class _SignupPage4State extends State<SignupPage4> {
  int currentPageNum = 3;
  int totalPages = 4;
  Map<String, bool> vaccinations = {
    'polio': false,
    'mmr': false,
    'hepatitis_b': false,
    'influenza': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Center(
          child: Column(
            children: [
              Spacer(flex: 1),
              Flexible(
                child: progressIndicator(),
              ),
              Spacer(flex: 2),
              Flexible(flex: 5, child: Align(alignment: Alignment.centerRight, child: Image.asset('assets/images/dadi-ammi.png'))),
              Flexible(
                flex: 5,
                child: Text(
                  'Choose the vaccinations your child has had',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          vaccinations['polio'] = !vaccinations['polio'];
                        });
                      },
                      child: Container(
                        color: COLORS.ACCENT_LIGHT,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Polio"),
                              Spacer(),
                              Icon(
                                Icons.circle,
                                color: vaccinations['polio'] ? COLORS.ACCENT_GREEN : COLORS.ACCENT_RED,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          vaccinations['mmr'] = !vaccinations['mmr'];
                        });
                      },
                      child: Container(
                        color: COLORS.ACCENT_LIGHT,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("MMR"),
                              Spacer(),
                              Icon(
                                Icons.circle,
                                color: vaccinations['mmr'] ? COLORS.ACCENT_GREEN : COLORS.ACCENT_RED,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          vaccinations['hepatitis_b'] = !vaccinations['hepatitis_b'];
                        });
                      },
                      child: Container(
                        color: COLORS.ACCENT_LIGHT,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Hepatitis b"),
                              Spacer(),
                              Icon(
                                Icons.circle,
                                color: vaccinations['hepatitis_b'] ? COLORS.ACCENT_GREEN : COLORS.ACCENT_RED,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          vaccinations['influenza'] = !vaccinations['influenza'];
                        });
                      },
                      child: Container(
                        color: COLORS.ACCENT_LIGHT,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Influenza"),
                              Spacer(),
                              Icon(
                                Icons.circle,
                                color: vaccinations['influenza'] ? COLORS.ACCENT_GREEN : COLORS.ACCENT_RED,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: RaisedButton(
                        color: COLORS.ACCENT_GREEN,
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => SignupPage5(
                                    email: widget.email,
                                    babyName: widget.babyName,
                                    babyDateOfBirth: widget.babyDateOfBirth,
                                    vaccinated: true,
                                    vaccinations: this.vaccinations,
                                  ));
                          Navigator.pushReplacement(context, route);
                        },
                        child: Text(
                          "Done",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget progressIndicator() {
    return Row(
      children: [
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 1 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 2 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 3 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 4 ? Colors.green : Colors.white),
        ),
      ],
    );
  }
}

class SignupPage5 extends StatefulWidget {
  final String email;
  final String babyName;
  final DateTime babyDateOfBirth;
  final bool vaccinated;
  final Map<String, bool> vaccinations;
  SignupPage5({this.babyDateOfBirth, this.vaccinated, @required this.vaccinations, @required this.email, @required this.babyName});
  @override
  _SignupPage5State createState() => _SignupPage5State();
}

class _SignupPage5State extends State<SignupPage5> {
  int currentPageNum = 4;
  int totalPages = 4;
  bool wantNotifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: progressIndicator(),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/dadi-ammi.png'),
                ),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 5,
                child: Text(
                  'Do you want Ammi to remind you about your child\'s vaccination?',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: RaisedButton(
                      color: COLORS.ACCENT_RED,
                      onPressed: () async {
                        var user = await AuthService.instance.createNewAmmiUser(
                          widget.email,
                          widget.babyName,
                          widget.babyDateOfBirth,
                          widget.vaccinated,
                          widget.vaccinations,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (c) => HomeScreen(currentAmmiUser: user),
                          ),
                        );
                        // Navigator.pushReplacementNamed(context, router.Router.instance.HOME);
                      },
                      child: Text(
                        "No",
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: RaisedButton(
                      color: COLORS.ACCENT_GREEN,
                      onPressed: () async {
                        var user = await AuthService.instance.createNewAmmiUser(
                          widget.email,
                          widget.babyName,
                          widget.babyDateOfBirth,
                          widget.vaccinated,
                          widget.vaccinations,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (c) => HomeScreen(
                              currentAmmiUser: user,
                            ),
                          ),
                        );
                        // Navigator.pushReplacementNamed(context, router.Router.instance.HOME);
                      },
                      child: Text(
                        "Yes",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget progressIndicator() {
    return Row(
      children: [
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 1 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 2 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 3 ? Colors.green : Colors.white),
        ),
        Flexible(
          child: Container(height: 10, color: currentPageNum >= 4 ? Colors.green : Colors.white),
        ),
      ],
    );
  }
}

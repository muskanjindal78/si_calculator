import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Interest",
    home: Calc(),
    debugShowCheckedModeBanner: false,
  ));
}

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  GlobalKey<FormState> _gkey = GlobalKey<FormState>();
  var _units = ['rupees', 'dollars', 'US dollars'];
  var _curSelection = 'rupees';
  String res = '';
  TextEditingController PrincipalText = TextEditingController();
  TextEditingController RateText = TextEditingController();
  TextEditingController TimeText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _gkey,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            children: [
              getImage(),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter a number';
                    },
                    controller: PrincipalText,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Enter Principal Amount',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  )),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter a number';
                    },
                    controller: RateText,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Enter Rate',
                        hintText: 'Enter rate like 0.1 (for 10% rate)',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  )),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter a number';
                    },
                    controller: TimeText,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Enter Time in years',
                        hintText:
                            'Enter time like 1.5 (for 1 year and 6 months)',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  )),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: DropdownButton(
                    items: _units.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (dynamic data) {
                      onDropdownChange(data);
                    },
                    value: _curSelection,
                  )),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        res = _calc();
                      });
                    },
                    child: Text(
                      'Calculate',
                      textScaleFactor: 1.5,
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.black12),
                  )),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5.0),
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _reset();
                      });
                    },
                    child: Text(
                      'Reset',
                      textScaleFactor: 1.5,
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.black12),
                  )),
                ],
              ),
              Text(res)
            ],
          ),
        ),
      ),
    );
  }

  Widget getImage() {
    AssetImage assetImage = AssetImage('images/si_image.jpg');
    Image image = Image(
      image: assetImage,
      width: 289,
      height: 141,
    );
    return Container(
      child: image,
    );
  }

  void onDropdownChange(data) {
    setState(() {
      _curSelection = data;
    });
  }

  String _calc() {
    double p = double.parse(PrincipalText.text);
    double r = double.parse(RateText.text);
    double t = double.parse(TimeText.text);
    double si = p * r * t;
    return "Simple interest of given values is $si ";
  }

  _reset() {
    PrincipalText.text = '';
    RateText.text = '';
    TimeText.text = '';
    res = '';
    _curSelection = 'rupees';
  }
}

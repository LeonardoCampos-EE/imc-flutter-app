import 'package:flutter/material.dart';

void main() {
  runApp(IMCApp());
}

class IMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "ImcApp", home: HomeWidget());
  }
}

// Home Widget
class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

// Home Widget state
class _HomeWidgetState extends State<HomeWidget> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String info = "No";

  void resetFields() {
    weightController.text = "";
    heightController.text = "";
    info = "Inform your Data!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(weightController, heightController, info),
        backgroundColor: Color(0xffF8EDED),
        body: SingleChildScrollView(
          child: IMCBody(weightController, heightController, info),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ));
  }
}

class GradientAppBar extends AppBar {
  GradientAppBar(TextEditingController weightController,
      TextEditingController heightController, String info)
      : super(
          title: const Text('IMC Calculator'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                weightController.text = "";
                heightController.text = "";
                info = "Inform your Data!";
              },
              icon: Icon(Icons.refresh),
              tooltip: "Refresh info",
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Color(0xffDD3E54), Color(0xff6BE585)])),
          ),
        );
}

class IMCBody extends Column {
  IMCBody(TextEditingController weightController,
      TextEditingController heightController, String info)
      : super(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120, color: Color(0xff6BE585)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight (kg)",
                    labelStyle:
                        TextStyle(color: Color(0xff6BE585), fontSize: 20)),
                textAlign: TextAlign.center,
                controller: weightController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height (cm)",
                    labelStyle:
                        TextStyle(color: Color(0xff6BE585), fontSize: 20)),
                textAlign: TextAlign.center,
                controller: heightController,
              ),
              ElevatedButton(
                  onPressed: () {
                    double weight = double.parse(weightController.text);
                    double height = double.parse(weightController.text) / 100;
                    double imc = weight / height * height;

                    if (imc < 18.6) {
                      info = "Abaixo do Peso! IMC = $imc";
                    }
                  },
                  child: Text("Calculate IMC"),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff6BE585),
                      textStyle: TextStyle(fontSize: 20))),
              Text(
                "$info",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff6BE585),
                  fontSize: 20,
                ),
              ),
            ]);
}

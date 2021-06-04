import 'package:flutter/material.dart';
import 'package:imc/imc_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
// part 'imc_controller.g.dart';

void main() {
  runApp(IMCApp());
}

// Initialize controller object
final controller = IMCController();

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
  // TextEditingController weightController = TextEditingController();
  // TextEditingController heightController = TextEditingController();
  // String info = "Inform your Data!";

  // void resetFields() {
  //   weightController.text = "";
  //   heightController.text = "";
  //   info = "Inform your Data!";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(),
        backgroundColor: Color(0xffF8EDED),
        body: SingleChildScrollView(
          child: IMCBody(),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ));
  }
}

class GradientAppBar extends AppBar {
  GradientAppBar()
      : super(
          title: const Text('IMC Calculator'),
          actions: <Widget>[
            Observer(builder: (_) => IconButton(
                onPressed: controller.resetStatus,
                icon: Icon(Icons.refresh),
                tooltip: "Refresh info",
              )
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

  // final _weightTextController = TextEditingController(text: "");
  // final _heightTextController = TextEditingController(text: "");

  IMCBody()
      : super(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120, color: Color(0xff6BE585)),
              Observer(
                builder: (_) => TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.weightStr = value,
                  decoration: InputDecoration(
                      labelText: "Weight (kg)",
                      labelStyle:
                          TextStyle(color: Color(0xff6BE585), fontSize: 20)),
                  textAlign: TextAlign.center,
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.heightStr = value,
                  decoration: InputDecoration(
                      labelText: "Height (cm)",
                      labelStyle:
                          TextStyle(color: Color(0xff6BE585), fontSize: 20)),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: controller.calculateIMC,
                  child: Text("Calculate IMC"),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff6BE585),
                      textStyle: TextStyle(fontSize: 20))),
              Observer(
                  builder: (_) => Text(
                        "${controller.bmiStatus}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff6BE585),
                          fontSize: 20,
                        ),
                      ))
            ]);
}

import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'imc_controller.g.dart';

abstract class _IMCController with Store {

  @observable
  TextEditingController weightTextController = TextEditingController();

  @observable
  TextEditingController heightTextController = TextEditingController();

  @observable
  String bmiStatus = "Inform your data!";

  @observable
  String weightStr = ""; // Weight in kg

  @observable
  String heightStr = ""; // Height in cm

  @action
  resetStatus() {
    bmiStatus = "Inform your data!";
    weightTextController.text = "";
    heightTextController.text = "";

    weightStr = "";
    heightStr = "";
  }

  @action
  calculateIMC() {
    double weight = double.parse(weightTextController.text);
    print("Weight: $weight");
    double height = double.parse(heightTextController.text) / 100;
    print("Height: $height");
    double bmiValue = weight/(height * height);
    print("BMI: $bmiValue");

    if (bmiValue < 18.5) {
      bmiStatus = "Underweight";
    } else if (bmiValue > 18.5 && bmiValue < 24.9) {
      bmiStatus = "Normal weight";
    } else if (bmiValue > 25.0 && bmiValue < 29.9) {
      bmiStatus = "Overweight";
    } else if (bmiValue > 30.0 && bmiValue < 34.9) {
      bmiStatus = "Obesity Level I";
    } else if (bmiValue > 35.0 && bmiValue < 39.9) {
      bmiStatus = "Obesity Level II";
    } else if (bmiValue > 40.0) {
      bmiStatus = "Obesity Level III";
    }
  }
}

class IMCController = _IMCController with _$IMCController;

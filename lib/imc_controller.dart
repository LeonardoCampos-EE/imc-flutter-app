import 'package:mobx/mobx.dart';
part 'imc_controller.g.dart';

abstract class _IMCController with Store {
  @observable
  String bmiStatus = "Inform your data!";

  @observable
  String weightStr = ""; // Weight in kg

  @observable
  String heightStr = ""; // Height in cm

  @action
  resetStatus() {
    bmiStatus = "Inform your data!";
    weightStr = "";
    heightStr = "";
  }

  @action
  calculateIMC() {
    double weight = double.parse(weightStr);
    print("Weight: $weight");
    double height = double.parse(heightStr) / 100;
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

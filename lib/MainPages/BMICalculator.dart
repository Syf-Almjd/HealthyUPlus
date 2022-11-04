import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int indexMaleFemale = 0;
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController age = TextEditingController();
  late double heightData, weightData, ageData, result;
  bool isVisible = false;
  late String statusText, url1Name, url1, url2Name, url2, url3Name, url3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.green),
          title: const Center(
            child:
                Text('BMI Calculator', style: TextStyle(color: Colors.green)),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    radioButton("Male", Colors.blueAccent, 0),
                    radioButton("Female", Colors.pink, 1),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "Height in CM :",
                  style: TextStyle(fontSize: 18, color: Color(0xff3a4b57)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,

                  // textAlign: TextAlign.center,
                  controller: height,
                  decoration: InputDecoration(
                    hintText: "Height (CM)",
                    filled: true,
                    prefixIcon: const Icon(Icons.height),
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Weight in KG:",
                  style: TextStyle(fontSize: 18, color: Color(0xff3a4b57)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  // textAlign: TextAlign.center,
                  controller: weight,

                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.monitor_weight_outlined),
                      hintText: "Weight (KG)",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Age:",
                  style: TextStyle(fontSize: 18, color: Color(0xff3a4b57)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  // textAlign: TextAlign.center,
                  controller: age,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_month),
                      hintText: "Age",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 60.0,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onPressed: () {
                      if (height.text.isEmpty) {
                        showToast("Height is required*");
                      }
                      if (weight.text.isEmpty) {
                        showToast("Weight is required*");
                      }
                      if (age.text.isEmpty) {
                        showToast("Age is required*");
                      }
                      heightData = double.parse(height.text);
                      weightData = double.parse(weight.text);
                      ageData = double.parse(age.text);
                      // var ageData = int.parse(age.text);
                      showToast(BMI(heightData, weightData).toString());
                      setState(() {
                        result = BMI(heightData, weightData);
                        ResultIndex(result);
                        isVisible = true;
                      });
                    },
                    child: const Text(
                      "Calculate",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BMIDetails(isVisible),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double BMI(double height, double weight) {
    double bmi = (weight / height / height) * 10000;
    double BMIValue = double.parse(bmi.toStringAsFixed(2));
    return BMIValue;
  }

  void showToast(String Value) => Fluttertoast.showToast(
        msg: Value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        // fontSize: 12.0
      );

  void MaleFemaleIndex(int index) {
    setState(() {
      indexMaleFemale = index;
    });
  }

  String ResultIndex(double result) {
    if (result <= 18.5) {
      setState(() {
        url1 =
            "https://www.muscleandfitness.com/nutrition/gain-mass/10-best-foods-help-skinny-guys-gain-muscle/";
        url1Name = "What foods should you eat?";
        url2 =
            "https://www.trifectanutrition.com/blog/how-to-gain-weight-fast-secrets-for-skinny-guys";
        url2Name = "Get more advices here";
        url3 =
            "https://www.nerdfitness.com/blog/a-skinny-guys-guide-to-building-muscle-and-bulking-up/";
        url3Name = "Bulking Options";

        statusText =
            "Re-balance meals to contain more meat (or soy for vegans/vegetarians), Eat more healthy calories, and Optimise your strength training.";
      });
      return 'assets/skinny.png';
    } else if (result >= 18.5 && result <= 22.9) {
      setState(() {
        url1 = "https://www.wikihow.com/Be-Healthy";
        url1Name = "Staying healthy";
        url2 = "https://www.nerdfitness.com/blog/how-to-build-your-own-workout-routine/";
        url2Name = "Workout Routine: Plans, Schedules, and Exercises";
        url3 = "https://health.ucdavis.edu/blog/good-food/top-15-healthy-foods-you-should-be-eating/2019/04";
        url3Name = "Healthy food to keep eating";

        statusText =
            "You body is Good! Keep eating a variety of nutrient rich foods. Your body actually needs more than 40 different nutrients for good health, and there is not one single source for them.";
      });

      return 'assets/normal.png';
    } else if (result >= 22.9 && result <= 24.9) {
      setState(() {
        url1 = "https://www.hsph.harvard.edu/obesity-prevention-source/obesity-consequences/health-effects/";
        url1Name = "Health Risks";
        url2 = "https://www.bighealthandfitness.co.uk/easy-workouts-for-overweight-beginners/";
        url2Name = "Effective and Easy Workouts";
        url3 = "https://my.clevelandclinic.org/health/diseases/11209-weight-control-and-obesity";
        url3Name = "Obesity Causes and Prevention";

        statusText =
            "Start choosing healthier foods (whole grains, fruits and vegetables, healthy fats and protein sources) and beverages.";
      });

      return 'assets/risk.png';
    } else if (result >= 24.9 && result <= 29.9) {
      setState(() {
        url1 = "https://www.who.int/news-room/fact-sheets/detail/obesity-and-overweight";
        url1Name = "Obesity and overweight";
        url2 = "https://www.healthline.com/health/fitness-exercise/exercise-for-obese-people#How-Much-Exercise-Do-You-Need?";
        url2Name = "Exercises You Need";
        url3 = "https://www.hsph.harvard.edu/obesity-prevention-source/diet-lifestyle-to-prevent-obesity/";
        url3Name = "Healthy Weight Checklist";

        statusText =
            "Achieving and maintaining a healthy weight includes healthy eating, physical activity, optimal sleep, and stress reduction.";
      });

      return 'assets/overweight.png';
    }
    url1 = "https://www.heart.org/en/healthy-living/healthy-eating/losing-weight/extreme-obesity-and-what-you-can-do";
    url1Name = "What You Can Do";
    url2 = "https://www.healthline.com/health/weight-loss/obesity";
    url2Name = "Causes of Obesity";
    url3 = "https://www.webmd.com/diet/obesity/ss/slideshow-obesity-weight-loss-tips";
    url3Name = "Tips to Lose that Weight";

    statusText =
        "The most important strategies for preventing obesity are healthy eating behaviors, regular physical activity, and reduced sedentary activity (such as watching television and videotapes, and playing computer games).";
    return 'assets/fat.png';
  }

  Widget BMIDetails(bool isVisibleBMIDetials) {
    return Column(
      children: [
        if (isVisibleBMIDetials == true) ...[
          Text(
            textAlign: TextAlign.center,
            "Details: $result BMI",
            style: const TextStyle(fontSize: 18, color: Color(0xff3a3b3a)),
          ),
          const SizedBox(
            height: 25.0,
            width: 25.0,
          ),
          Text(
            textAlign: TextAlign.center,
            "$statusText",
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(
            height: 25.0,
            width: 25.0,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(
                  children: [
                    Image.asset(ResultIndex(result), scale: 2),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),

              Container(
                child: Column(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      onPressed: () {
                        showToast("Click the back Button to go back");
                        _launchUrl(url1);
                      },
                      child: Text(
                        "$url1Name",
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      onPressed: () {
                        showToast("Click the back Button to go back");
                        _launchUrl(url2);
                      },
                      child: Text(
                        "$url2Name",
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      onPressed: () {
                        showToast("Click the back Button to go back");
                        _launchUrl(url3);
                      },
                      child: Text(
                        "$url3Name",
                      ),
                    ),
                  ],
                ),
              ),
              // ),
            ],
          ),
        ]
      ],
    );
  }

  Future<void> _launchUrl(String urlLink) async {
    final Uri _url = Uri.parse(urlLink);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 80,
        child: FlatButton(
            color: indexMaleFemale == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {
              MaleFemaleIndex(index);
            },
            child: Text(
              value,
              style: TextStyle(
                  color: indexMaleFemale == index ? Colors.white : color),
            )),
      ),
    );
  }
}

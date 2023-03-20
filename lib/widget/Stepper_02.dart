import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Stepper02 extends StatefulWidget {
  const Stepper02({Key? key}) : super(key: key);

  @override
  State<Stepper02> createState() => _Stepper02();
}

class _Stepper02 extends State<Stepper02> {
  final address = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final postcode = TextEditingController();
  int currentStep = 0;
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Stepper"),
      ),
      body: isCompleted
          ? success()
          : Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(primary: Colors.red),
              ),
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: () {
                  final isLastStep = currentStep == getSteps().length - 1;
                  if (isLastStep) {
                    setState(() {
                      isCompleted = true;
                    });
                    print("Completed");
                  } else {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                },
                onStepTapped: (step) => setState(() => currentStep = step),
                onStepCancel: currentStep == 0
                    ? null
                    : () => setState(() {
                          currentStep -= 1;
                        }),
                controlsBuilder: (context, details) {
                  final isLastStep = currentStep == getSteps().length - 1;
                  return Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text(isLastStep ? 'CONFIRM' : "NEXT"),
                            onPressed: details.onStepContinue,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        if (currentStep != 0)
                          Expanded(
                            child: ElevatedButton(
                              child: const Text("BACK"),
                              onPressed: details.onStepCancel,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
      backgroundColor: Colors.grey[300],
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text("Account"),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: firstName,
                decoration: InputDecoration(labelText: "FirstName"),
              ),
              TextFormField(
                controller: lastName,
                decoration: InputDecoration(labelText: "LastName"),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text("Account"),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: address,
                decoration: const InputDecoration(
                  labelText: "Address",
                ),
              ),
              TextFormField(
                controller: postcode,
                decoration: const InputDecoration(
                  labelText: "Postcode",
                ),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text("Account"),
          content: Container(),
        ),
      ];

  Widget success() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            const Text(
              "Success",
              style: TextStyle(
                color: Colors.green,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCompleted = false;
                  currentStep = 0;
                  firstName.clear();
                  lastName.clear();
                  address.clear();
                  postcode.clear();
                });
              },
              child: const Text("Reset"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                textStyle: const TextStyle(fontSize: 24),
                minimumSize: const Size.fromHeight(50),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Stepper01 extends StatefulWidget {
  const Stepper01({Key? key}) : super(key: key);

  @override
  State<Stepper01> createState() => _Stepper01();
}

class _Stepper01 extends State<Stepper01> {
  int currentStep = 0;
  continueStep() async {
    if (currentStep < 2) {
      setState(() {
        print(currentStep);
        currentStep = currentStep + 1;
      });
    }
  }

  cancelStep() async {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1;
      });
    }
  }

  onStepTapped(int value) async {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlsBuilder(context, details) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: details.onStepContinue,
          child: const Text("Next"),
        ),
        const SizedBox(
          width: 10,
        ),
        OutlinedButton(
          onPressed: details.onStepCancel,
          child: const Text("Back"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stepper(
          // * ระบุบ step
          // * แนวนอน
          type: StepperType.horizontal,
          // * แนวนอน
          elevation: 0,
          currentStep: currentStep,
          onStepContinue: continueStep,
          onStepCancel: cancelStep,
          onStepTapped: onStepTapped,
          controlsBuilder: controlsBuilder,
          steps: [
            // * 0
            Step(
              title: Text("Step 1"),
              content: Column(
                children: const [
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                  Text("Hello World"),
                ],
              ),
              isActive: currentStep >= 0,
              // * ต้องตรงกำหนดเงือนไข จะไม่สามากดข้ามได้
              state: currentStep >= 0 ? StepState.complete : StepState.disabled,
            ),
            // * 1
            Step(
              title: Text("Step 2"),
              content: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Type 02"),
                ],
              )),
              isActive: currentStep >= 1,
              // * ต้องตรงกำหนดเงือนไข จะไม่สามากดข้ามได้
              state: currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            // * 2
            Step(
              title: Text("Step 3"),
              content: Text("This is the"),
              isActive: currentStep >= 2,
              // * ต้องตรงกำหนดเงือนไข จะไม่สามากดข้ามได้
              state: currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}

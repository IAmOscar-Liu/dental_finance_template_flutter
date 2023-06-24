import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_page_title.dart';
import 'package:namer_app/components/form/contract_form.dart';
import 'package:namer_app/components/form/dental_form.dart';
import 'package:namer_app/components/form/summarize_form.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int currentFormStep = 1;

  Color getActiveColor(int formStep) {
    return formStep == currentFormStep ? Colors.black : Colors.grey;
  }

  Widget getCurrentForm() {
    switch (currentFormStep) {
      case 1:
        return DentalForm();
      case 2:
        return ContractForm();
      case 3:
        return SummarizeForm();
      default:
        return Container();
    }
  }

  Widget multiStepTextButton({required int step, required String title}) {
    return TextButton(
        onPressed: () {
          setState(() {
            currentFormStep = step;
          });
        },
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: getActiveColor(step)),
                  borderRadius: BorderRadius.circular(1000)),
              child: Center(
                child: Text(
                  step.toString(),
                  style: TextStyle(color: getActiveColor(step)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                title,
                style: TextStyle(color: getActiveColor(step)),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // MyAppState appState = context.watch<MyAppState>();

    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding:
                  EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 36),
              child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1000),
                  child: Column(
                    children: [
                      CustomPageTitle(
                          pageTitle: "合約管理/新增合約",
                          pageTitleIconData: Icons.add,
                          tailling: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios),
                                  Text("上一頁"),
                                ],
                              ))),
                      SizedBox(
                        height: 16,
                      ),
                      Row(children: [
                        Spacer(flex: 1),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              multiStepTextButton(step: 1, title: "牙技所資料設定"),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              multiStepTextButton(step: 2, title: "合約資料設定"),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              multiStepTextButton(step: 3, title: "合約內容確認"),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        FilledButton(
                            onPressed: currentFormStep != 3 ? null : () {},
                            child: Text("送出合約"))
                      ]),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: currentFormStep == 1
                                          ? null
                                          : () {
                                              setState(() {
                                                currentFormStep--;
                                              });
                                            },
                                      child: Text("上一步")),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                      onPressed: currentFormStep == 3
                                          ? null
                                          : () {
                                              setState(() {
                                                currentFormStep++;
                                              });
                                            },
                                      child: Text("下一步")),
                                ],
                              ),
                              getCurrentForm()
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}

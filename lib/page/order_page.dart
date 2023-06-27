import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_page_title.dart';
import 'package:namer_app/components/form/contract_form.dart';
import 'package:namer_app/components/form/dental_form.dart';
import 'package:namer_app/components/form/summarize_form.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:namer_app/services/dio_client.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  DioClient _client = DioClient();

  int currentFormStep = 1;
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  bool isValidForm(BuildContext context, MyAppState appState) {
    if (currentFormStep == 3) return true;
    bool result = formKeys[currentFormStep - 1].currentState!.validate();

    if (currentFormStep == 1) {
      if (appState.dentalForm["牙技所縣市"] == "請選擇") {
        appState.setDentalAddressCityErrorMessage("This field is required");
        result = false;
      } else {
        appState.setDentalAddressCityErrorMessage(null);
      }

      if (appState.dentalForm["牙技所鄉鎮市區"] == "請選擇") {
        appState.setDentalAddressDistrictErrorMessage("This field is required");
        result = false;
      } else {
        appState.setDentalAddressDistrictErrorMessage(null);
      }
    }

    return result;
  }

  void showInvalidFormMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text("Invalid form data, please fill out the form correctly.")));
  }

  Color getActiveColor(int formStep) {
    return formStep == currentFormStep ? Colors.black : Colors.grey;
  }

  Widget getCurrentForm({required MyAppState appState}) {
    switch (currentFormStep) {
      case 1:
        return DentalForm(
          formKey: formKeys[0],
          appState: appState,
        );
      case 2:
        return ContractForm(
          formKey: formKeys[1],
          appState: appState,
        );
      case 3:
        return SummarizeForm();
      default:
        return Container();
    }
  }

  Widget multiStepTextButton(
      {required BuildContext context,
      required MyAppState appState,
      required int step,
      required String title}) {
    return TextButton(
        onPressed: () {
          if (step == currentFormStep) return;
          if (step < currentFormStep || isValidForm(context, appState)) {
            return setState(() {
              currentFormStep = step;
            });
          }
          showInvalidFormMessage(context);
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
    MyAppState appState = context.watch<MyAppState>();

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
                              multiStepTextButton(
                                  context: context,
                                  appState: appState,
                                  step: 1,
                                  title: "牙技所資料設定"),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              multiStepTextButton(
                                  context: context,
                                  appState: appState,
                                  step: 2,
                                  title: "合約資料設定"),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              multiStepTextButton(
                                  context: context,
                                  appState: appState,
                                  step: 3,
                                  title: "合約內容確認"),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        FilledButton(
                            onPressed: currentFormStep != 3
                                ? null
                                : () {
                                    _client
                                        .createDentalAndContract(
                                            dentalForm: appState.dentalForm,
                                            contractForm: appState.contractForm)
                                        .then((_) {
                                      appState.resetAllForms();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Contract has been submitted!")));

                                      Navigator.pushNamed(
                                          context, "/management");
                                    });
                                  },
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
                                              if (isValidForm(
                                                  context, appState)) {
                                                setState(() {
                                                  currentFormStep++;
                                                });
                                              } else {
                                                showInvalidFormMessage(context);
                                              }
                                            },
                                      child: Text("下一步")),
                                ],
                              ),
                              getCurrentForm(appState: appState)
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

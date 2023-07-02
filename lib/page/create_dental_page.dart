import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_page_title.dart';
import 'package:namer_app/components/form/dental_form.dart';
import 'package:namer_app/components/form/summarize_form.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:namer_app/services/dio_client.dart';
import 'package:namer_app/types.dart';
import 'package:provider/provider.dart';

class CreateDentalPage extends StatefulWidget {
  @override
  State<CreateDentalPage> createState() => _CreateDentalPageState();
}

class _CreateDentalPageState extends State<CreateDentalPage> {
  DioClient _client = DioClient();
  final List<CurrentFormStep> _formSteps = [
    CurrentFormStep.dental,
    CurrentFormStep.summarize
  ];
  CurrentFormStep _currentFormStep = CurrentFormStep.dental;
  GlobalKey<FormState> _dentalFormKey = GlobalKey<FormState>();

  bool isValidForm(BuildContext context, MyAppState appState) {
    if (_currentFormStep == CurrentFormStep.summarize) return true;
    bool result = _dentalFormKey.currentState!.validate();

    if (_currentFormStep == CurrentFormStep.dental) {
      if (appState.dentalForm["牙技所地區"] == "請選擇") {
        appState.setDentalRegionErrorMessage("This field is required");
        result = false;
      } else {
        appState.setDentalRegionErrorMessage(null);
      }

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

  Color getActiveColor(CurrentFormStep formStep) {
    return formStep == _currentFormStep ? Colors.black : Colors.grey;
  }

  Widget getCurrentForm({required MyAppState appState}) {
    switch (_currentFormStep) {
      case CurrentFormStep.dental:
        return DentalForm(
          formKey: _dentalFormKey,
          appState: appState,
        );
      case CurrentFormStep.summarize:
        return SummarizeForm(
          dentalFormOnly: true,
        );
      default:
        return Container();
    }
  }

  Widget multiStepTextButton(
      {required BuildContext context,
      required MyAppState appState,
      required CurrentFormStep step,
      required String title}) {
    return TextButton(
        onPressed: () {
          if (step == _currentFormStep) return;
          if (_formSteps.indexOf(step) < _formSteps.indexOf(_currentFormStep) ||
              isValidForm(context, appState)) {
            return setState(() {
              _currentFormStep = step;
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
                  (_formSteps.indexOf(step) + 1).toString(),
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
                          pageTitle: "牙技所管理/新增牙技所",
                          pageTitleIconData: Icons.add,
                          tailling: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/dental-management");
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios),
                                  Text("回牙技所管理"),
                                ],
                              ))),
                      SizedBox(
                        height: 16,
                      ),
                      Row(children: [
                        Spacer(flex: 1),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              multiStepTextButton(
                                  context: context,
                                  appState: appState,
                                  step: CurrentFormStep.dental,
                                  title: "牙技所資料設定"),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              multiStepTextButton(
                                  context: context,
                                  appState: appState,
                                  step: CurrentFormStep.summarize,
                                  title: "牙技所內容確認"),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        FilledButton(
                            onPressed:
                                _currentFormStep != CurrentFormStep.summarize
                                    ? null
                                    : () {
                                        _client
                                            .createDental(
                                          dentalForm: appState.dentalForm,
                                        )
                                            .then((_) {
                                          appState.resetDentalForms();

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Dental lab has been submitted!")));

                                          Navigator.pushNamed(
                                              context, "/dental-management");
                                        });
                                      },
                            child: Text("送出牙技所"))
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
                                      onPressed: _formSteps
                                                  .indexOf(_currentFormStep) ==
                                              0
                                          ? null
                                          : () {
                                              setState(() {
                                                _currentFormStep = _formSteps[
                                                    _formSteps.indexOf(
                                                            _currentFormStep) -
                                                        1];
                                              });
                                            },
                                      child: Text("上一步")),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                      onPressed: _formSteps
                                                  .indexOf(_currentFormStep) ==
                                              _formSteps.length - 1
                                          ? null
                                          : () {
                                              if (isValidForm(
                                                  context, appState)) {
                                                setState(() {
                                                  _currentFormStep = _formSteps[
                                                      _formSteps.indexOf(
                                                              _currentFormStep) +
                                                          1];
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

import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_page_title.dart';
import 'package:namer_app/components/form/contract_form.dart';
import 'package:namer_app/components/form/contract_form_advance.dart';
import 'package:namer_app/components/form/summarize_form.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:namer_app/services/dio_client.dart';
import 'package:namer_app/types.dart';
import 'package:provider/provider.dart';

class CreateContractPage extends StatefulWidget {
  @override
  State<CreateContractPage> createState() => _CreateContractPageState();
}

class _CreateContractPageState extends State<CreateContractPage> {
  DioClient _client = DioClient();

  final List<CurrentFormStep> _formSteps = [
    CurrentFormStep.contract,
    CurrentFormStep.contractAdvance,
    CurrentFormStep.summarize
  ];
  CurrentFormStep _currentFormStep = CurrentFormStep.contract;
  GlobalKey<FormState> _contractFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _contractAdvanceFormKey = GlobalKey<FormState>();

  bool isValidForm(BuildContext context, MyAppState appState) {
    if (_currentFormStep == CurrentFormStep.summarize) return true;
    bool result = (_currentFormStep == CurrentFormStep.contract
            ? _contractFormKey
            : _contractAdvanceFormKey)
        .currentState!
        .validate();

    if (_currentFormStep == CurrentFormStep.contract) {
      if (appState.contractForm["合約種類"] == "請選擇") {
        appState.setContractContractTypeErrorMessage("This field is required");
        result = false;
      } else {
        appState.setContractContractTypeErrorMessage(null);
      }

      if (appState.contractForm["合約收費方案"] == "請選擇") {
        appState.setContractChargeMethodsErrorMessage("This field is required");
        result = false;
      } else {
        appState.setContractChargeMethodsErrorMessage(null);
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
      case CurrentFormStep.contract:
        return ContractForm(
          formKey: _contractFormKey,
          appState: appState,
        );
      case CurrentFormStep.contractAdvance:
        return ContractFormAdcvance(
            formKey: _contractAdvanceFormKey, appState: appState);
      case CurrentFormStep.summarize:
        return SummarizeForm();
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
                          pageTitle: "合約管理/新增合約",
                          pageTitleIconData: Icons.add,
                          tailling: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/contract-management");
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios),
                                  Text("回合約管理"),
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
                                  step: CurrentFormStep.contract,
                                  title: "合約基本資料設定"),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              multiStepTextButton(
                                  context: context,
                                  appState: appState,
                                  step: CurrentFormStep.contractAdvance,
                                  title: "合約進階資料設定"),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              multiStepTextButton(
                                  context: context,
                                  appState: appState,
                                  step: CurrentFormStep.summarize,
                                  title: "合約內容確認"),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        FilledButton(
                            onPressed: _currentFormStep !=
                                    CurrentFormStep.summarize
                                ? null
                                : () {
                                    _client
                                        .createContract(
                                            selectedDentalID:
                                                appState.selectedDentalID,
                                            contractForm: appState.contractForm)
                                        .then((_) {
                                      appState.resetContractForms();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Contract has been submitted!")));

                                      Navigator.pushNamed(
                                          context, "/contract-management");
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
                                      onPressed:
                                          _formSteps.indexOf(_currentFormStep) ==
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
                                      onPressed: _currentFormStep ==
                                              CurrentFormStep.summarize
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

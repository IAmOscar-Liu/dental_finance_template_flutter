import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    // MyAppState appState = context.watch<MyAppState>();
    //Color activeColor =

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
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 4),
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "合約管理/新增合約",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_back_ios),
                                      Text("上一頁"),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(children: [
                        Spacer(flex: 1),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    currentFormStep = 1;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: getActiveColor(1)),
                                          borderRadius:
                                              BorderRadius.circular(1000)),
                                      child: Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: getActiveColor(1)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Text(
                                        "牙技所資料設定",
                                        style: TextStyle(
                                            color: getActiveColor(1)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    currentFormStep = 2;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: getActiveColor(2)),
                                          borderRadius:
                                              BorderRadius.circular(1000)),
                                      child: Center(
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              color: getActiveColor(2)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Text(
                                        "合約資料設定",
                                        style: TextStyle(
                                            color: getActiveColor(2)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                height: 2,
                                color: Colors.grey,
                              )),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    currentFormStep = 3;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: getActiveColor(3)),
                                          borderRadius:
                                              BorderRadius.circular(1000)),
                                      child: Center(
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                              color: getActiveColor(3)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Text(
                                        "合約內容確認",
                                        style: TextStyle(
                                            color: getActiveColor(3)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
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

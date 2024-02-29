// ignore_for_file: unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_generator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/show_money_share_ui.dart';

class InputMoneyUi extends StatefulWidget {
  const InputMoneyUi({super.key});

  @override
  State<InputMoneyUi> createState() => _InputMoneyUiState();
}

class _InputMoneyUiState extends State<InputMoneyUi> {
  bool? checkStatus = false;

  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  //bulid a method to display warnning message
  warningMessage(context, msg) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 79, 95),
                    borderRadius: BorderRadius.circular(0)),
                child: Center(
                  child: Text(
                    'คำเตือน',
                    style: GoogleFonts.kanit(color: Colors.white),
                  ),
                ),
              ),
              content: Text(
                msg,
                style: GoogleFonts.kanit(
                  color: const Color.fromARGB(255, 244, 79, 95),
                ),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.kanit(
                      color: Colors.white
                    ),
                  ),
                  style:
                      ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 244, 79, 95),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)
                        )
                      ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 165, 165),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 79, 95),
        title: Text(
          'แชร์เงินกันเถอะ',
          style: GoogleFonts.itim(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusScopeNode());
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.2,
                    backgroundColor: const Color.fromARGB(255, 244, 79, 95),
                    child: Image.asset(
                      'assets/images/money.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  //TextField money
                  TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[0-9]+.?[0-9]*'))
                    ],
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'ป้อนจำนวนเงิน(บาท)',
                        hintStyle: GoogleFonts.kanit(color: Colors.white),
                        prefixIcon: Icon(
                          FontAwesomeIcons.moneyBillWave,
                          color: Colors.yellow,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  //TextField person
                  TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"\d+([\.]\d+)?"))
                    ],
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'ป้อนจำนวนคน(คน)',
                        hintStyle: GoogleFonts.kanit(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.yellow,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  //checkbox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            if (value == false) {
                              setState(() {
                                tipCtrl.text = '';
                              });
                            }
                            checkStatus = value;
                          });
                        },
                        value: checkStatus,
                        activeColor: Colors.red,
                        side: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'เงินทิป (บาท)',
                        style: GoogleFonts.kanit(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  //TextField tip
                  TextField(
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    enabled: checkStatus,
                    decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'ป้อนจำนวนเงินทิป(บาท)',
                        hintStyle: GoogleFonts.kanit(color: Colors.white),
                        prefixIcon: Icon(
                          FontAwesomeIcons.moneyBillWave,
                          color: Colors.yellow,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  //Calculate button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            double money = 0, tip = 0, moneyshare = 0;
                            int person = 0;
                            if (moneyCtrl.text.length == 0) {
                              //display message num of money is not entered
                              warningMessage(
                                  context, 'number of money is not entered');
                              return;
                            } else if (double.parse(moneyCtrl.text) == 0) {
                              //display message value of money not 0
                              warningMessage(
                                  context, 'value of money should not be 0');
                              return;
                            } else if (personCtrl.text.isEmpty == true) {
                              //display number of people has not been entered
                              warningMessage(context,
                                  'number of people has not been entered');
                              return;
                            } else if (int.parse(personCtrl.text) == 0) {
                              //display value of money not 0
                              warningMessage(
                                  context, 'number of people should not be 0');
                              return;
                            } else if (checkStatus == true) {
                              if (tipCtrl.text.length == 0) {
                                //display message num tip not entered
                                warningMessage(
                                    context, 'number of tip not entered');
                                return;
                              } else if (double.parse(tipCtrl.text) == 0) {
                                //display message value of tip not 0
                                warningMessage(
                                    context, 'value of tip should not be 0');
                                return;
                              } else {
                                money = double.parse(moneyCtrl.text);
                                tip = double.parse(tipCtrl.text);
                                person = int.parse(personCtrl.text);
                                moneyshare = (money + tip) / person;
                              }
                            } else {
                              money = double.parse(moneyCtrl.text);
                              person = int.parse(personCtrl.text);
                              moneyshare = money / person;
                            }
                            //open ShowMoneyShare display
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: money,
                                  person: person,
                                  tip: moneyshare,
                                  moneyshare: moneyshare,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.calculate,
                            color: Colors.white,
                          ),
                          label: Text(
                            'คำนวณ',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(
                                // MediaQuery.of(context).size.width * 0.35,
                                55.0),
                            backgroundColor:
                                const Color.fromARGB(255, 244, 26, 11),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(10.0),
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      //Cancel button
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              moneyCtrl.text = '';
                              personCtrl.text = '';
                              tipCtrl.text = '';
                              checkStatus = false;
                            });
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ยกเลิก',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(
                                // MediaQuery.of(context).size.width * 0.35,
                                55.0),
                            backgroundColor:
                                const Color.fromARGB(255, 244, 26, 11),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(10.0),
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

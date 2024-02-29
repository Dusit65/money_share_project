// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowMoneyShareUI extends StatefulWidget {
  double? money, tip, moneyshare;
  int? person;

  ShowMoneyShareUI({
    super.key,
    this.money,
    this.tip,
    this.moneyshare,
    this.person,
  });

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 193, 193),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 79, 95),
        title: Text(
          'แชร์เงินกันเถอะ(ผล)',
          style: GoogleFonts.kanit(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
              Text(
                'จำนวนเงินที่จะหาร',
                style: GoogleFonts.itim(
                  color: const Color.fromARGB(255, 244, 79, 95),
                  fontSize: 20,
                ),
              ),
              Text(
                widget.money!.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                style: GoogleFonts.itim(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  color: const Color.fromARGB(255, 244, 79, 95),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text('จำนวนคนที่จะหาร',
                  style: GoogleFonts.itim(
                    color: const Color.fromARGB(255, 244, 79, 95),
                    fontSize: 20,
                  )),
              Text(widget.person!.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                  style: GoogleFonts.itim(
                    color: Colors.white,
                    fontSize: 30,
                  )),
              Text('คน',
                  style: GoogleFonts.itim(
                    color: const Color.fromARGB(255, 244, 79, 95),
                    fontSize: 20,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text('จำนวนเงินทิป',
                  style: GoogleFonts.itim(
                    color: const Color.fromARGB(255, 244, 79, 95),
                    fontSize: 20,
                  )),
              Text(widget.moneyshare!.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                  style: GoogleFonts.itim(
                    color: Colors.white,
                    fontSize: 30,
                  )),
              Text('บาท',
                  style: GoogleFonts.itim(
                    color: const Color.fromARGB(255, 244, 79, 95),
                    fontSize: 20,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text('แชร์เงินกันคนละ',
                  style: GoogleFonts.itim(
                    color: const Color.fromARGB(255, 244, 79, 95),
                    fontSize: 20,
                  )),
              //     SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.01,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  
                  height: MediaQuery.of(context).size.height *0.08,
                  width: MediaQuery.of(context).size.width *0.7,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 79, 95),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Center(
                    child: Text(widget.tip!.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                    
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                  ),
                ),
              ),
              Text('บาท',
                  style: GoogleFonts.itim(
                    color: const Color.fromARGB(255, 244, 79, 95),
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

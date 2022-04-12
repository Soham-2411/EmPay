// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<List<String>> employeeDetails = [
  ["Parth Pandey", "Senior Developer", "Click to see more details"],
  ["Aakash Pandey", "Tester", "Click to see more details"],
  ["Parth Srivastava", "Backend Developer", "Click to see more details"],
  ["Eeshan Dutta", "Blockchain Developer", "Click to see more details"],
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: h * 0.15,
          elevation: 0,
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'WELCOME BACK',
                  style: TextStyle(
                      fontSize: w * 0.04, fontWeight: FontWeight.w200)),
              TextSpan(
                  text: '\nSOHAM SAKARIA',
                  style: TextStyle(
                      fontSize: w * 0.075, fontWeight: FontWeight.bold))
            ]),
          ),
          backgroundColor: HexColor("#5400ff"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Manage your employees",
                style: TextStyle(color: Colors.black, fontSize: w * 0.06),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: employeeDetails.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: w * 0.02,
                  mainAxisSpacing: w * 0.02,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return EmployeeCard(h, w, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget EmployeeCard(double h, double w, int index) {
    return Padding(
      padding: EdgeInsets.only(top: h * 0.02, left: w * 0.02, right: w * 0.02),
      child: TextButton(
        onPressed: () {},
        child: Card(
          elevation: 20,
          shadowColor: Colors.black38,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Container(
            height: h * 0.2,
            width: w * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Employee",
                          style: TextStyle(
                              fontSize: w * 0.025, color: Colors.grey)),
                      TextSpan(
                          text: "\n\n" + employeeDetails[index][0],
                          style: TextStyle(
                              fontSize: w * 0.03, color: Colors.blue)),
                      TextSpan(
                          text: "\n" + employeeDetails[index][1],
                          style: TextStyle(
                              fontSize: w * 0.03, color: Colors.blue)),
                      TextSpan(
                          text: "\n\n" + employeeDetails[index][2],
                          style:
                              TextStyle(fontSize: w * 0.03, color: Colors.grey))
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

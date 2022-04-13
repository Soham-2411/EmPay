import 'package:empay/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EmployeeDetails extends StatefulWidget {
  final int index;
  const EmployeeDetails({super.key, required this.index});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

double salary = 0;
String department = '';

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    void initState() {
      super.initState();
      salary = double.parse(employeeDetails[widget.index][2]);
      department = employeeDetails[widget.index][3];
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: h * 0.15,
        elevation: 0,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: employeeDetails[widget.index][0],
                style:
                    TextStyle(fontSize: w * 0.075, fontWeight: FontWeight.bold))
          ]),
        ),
        backgroundColor: HexColor("#5400ff"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Details ",
                style:
                    TextStyle(fontSize: w * 0.09, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Job Title",
                style:
                    TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: AbsorbPointer(
                  absorbing: true,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintStyle:
                            TextStyle(fontSize: w * 0.05, color: Colors.black),
                        hintText: employeeDetails[widget.index][1],
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Salary",
                style:
                    TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: AbsorbPointer(
                  absorbing: false,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          salary = 0;
                        } else {
                          salary = double.parse(value);
                        }
                      });
                    },
                    initialValue: salary.toString(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Department",
                style:
                    TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: AbsorbPointer(
                  absorbing: false,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        department = value;
                      });
                    },
                    initialValue: department,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (salary != null && department != null) {
                        employeeDetails[widget.index][2] = salary.toString();
                        employeeDetails[widget.index][3] = department;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomePage())));
                      }
                    });
                  },
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.black38,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: SizedBox(
                      height: h * 0.07,
                      width: w * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                  text: "Save",
                                  style: TextStyle(color: Colors.black)))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

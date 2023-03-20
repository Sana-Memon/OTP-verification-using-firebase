import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signing_in_through_otp/controller.dart';
import 'package:signing_in_through_otp/otp.dart';

class MyPhone extends StatefulWidget {
  static String verify = "";

  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  VerifyPhone vp = VerifyPhone();
  TextEditingController countryCode = TextEditingController();
  var PhoneNo = "";
  void initState() {
    countryCode.text = "+92";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 35, right: 35),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/img.png"),
              Text(
                "Phone Verification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              Text("We need to registr your phone before getting started"),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryCode,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      child: Text(
                        "|",
                        style: TextStyle(fontSize: 33),
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: ((value) {
                          PhoneNo = value;
                        }),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: ("Phone")),
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    vp.sendcode(context, countryCode, PhoneNo, MyPhone.verify);
                  },
                  child: Text("Send the code"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

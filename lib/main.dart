import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final textcontroller=TextEditingController();
    final _formkey=GlobalKey();
    var value;
    Color hexToColor(String code) {
      return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Arithematic Verify ",
        home: Material(
            child: Form(
              key: _formkey,
              child: Container (
                  padding: const EdgeInsets.all(30.0),
                  color: Colors.white,
                  child: Container(
                    child: Center(
                        child: Column(
                            children : [
                               Padding(padding: EdgeInsets.only(top: 140.0)),
                               Text('Arithemtic Operator Verify',
                                style: TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                               Padding(padding: EdgeInsets.only(top: 50.0)),
                               TextFormField(
                                 controller: textcontroller,
                                decoration: InputDecoration(
                                  labelText: "Enter Operator ",
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                    ),
                                  ),
                                  //fillColor: Colors.green
                                ),
                                validator: (val) {
                                  if(val?.length==0) {
                                    return "Operator cannot be empty";
                                  }else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                ),
                              ),
                                SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                   Container(
                                      height: 40,
                                      width: 140,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                color: hexToColor("#F2A03D"),
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: Text('Verify'),
                                        onPressed: () {
                                          value=textcontroller.text;
                                          if(value=='+' || value=='-' || value=='*' || value=='/' || value=='%'){
                                            CoolAlert.show(
                                              context: context,
                                              type: CoolAlertType.success,
                                              title: 'Successful',
                                              text: "You entered Arithematic Operator $value",
                                            );
                                          }
                                          else {
                                            CoolAlert.show(
                                              context: context,
                                              type: CoolAlertType.error,
                                              title: 'Error',
                                              text: "invalid entry $value",

                                            );
                                          }
                                        },
                                      ),
                                    ),


                                ],

                              )
                            ]
                        )
                    ),
                  )
              ),
            )
        )
    );
  }
}
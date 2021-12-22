import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: hexToColor("#F2A03D"),
          title: Text('Compiler Project'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      Text('Arithematic Operator Verify',style: TextStyle(
                        color:  hexToColor("#F2A03D"),
                        fontSize: 20,
                      ),),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(

                          controller: nameController,
                          decoration: InputDecoration(
                            errorText: _validate ? 'field Can\'t Be Empty' : null,
                            border: OutlineInputBorder(),
                            labelText: 'Enter Operator',
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 120,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(color: hexToColor("#F2A03D"))
                              ),
                              textColor: Colors.white,
                              color:  hexToColor("#F2A03D"),
                              child: Text('Verify',style: TextStyle(fontSize: 16),),
                              onPressed: (){
                                if(nameController.text.toString()=='+' || nameController.text=='-' || nameController.text=='*' || nameController.text=='/' || nameController.text=='%'){
                                  CoolAlert.show(
                                    context: context,
                                    title: 'Success',
                                    type: CoolAlertType.success,
                                    text: "You entered an operator ${nameController.text}",
                                  );
                                }
                                else if (nameController.text.isEmpty){
                                  setState(() {
                                    nameController.text.isEmpty ? _validate = true : _validate = false;
                                  });
                                }
                                else{
                                  CoolAlert.show(
                                    context: context,
                                    title: 'Error',
                                    type: CoolAlertType.error,
                                    text: "invalid entry ${nameController.text}",
                                  );
                                }
                              },
                            ),
                          ),
                        ],

                      ),
                    ],

                  )
              ),
            ),
        Expanded(flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('developed by Muhammad Javed',style: TextStyle(
              fontSize: 9,
              color: hexToColor("#F2A03D"),
            ),),
          ],

        ),),
          ],
        )


    );
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
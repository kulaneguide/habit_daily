import 'package:flutter/material.dart';

import 'login.dart';


// import 'package:untitled4/Login.dart';
//  import 'package:quickalert/quickalert.dart';


void main(){
  runApp(SingUp());
}
class SingUp extends StatefulWidget {
  const SingUp({super.key});



  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  String email="";

  String Password="";
  TextEditingController userNameControl =TextEditingController();
  TextEditingController emailcontrol =TextEditingController();
  TextEditingController Passwordcontrol =TextEditingController();
  final fromkey=GlobalKey<FormState>();
  String?validemail(String?email){
    RegExp emailRegax=RegExp(r'@');
    final isEmailValid=emailRegax.hasMatch(email??'');
    if(!isEmailValid){
      return'please Enter a valid email';
    }
    return null;

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        // appBar: AppBar(
        //     backgroundColor: Colors.purpleAccent,
        //     leading: IconButton( icon: Icon(Icons.arrow_back),
        //       color: Colors.white,
        //       iconSize: 26,
        //       onPressed: ()=>Navigator.of(context).pop(),
        //
        //     )
        // ),

        body:

        SingleChildScrollView(

          child:  Form(
            key: fromkey,
            child: Column(

              children: [
                SizedBox(height: 70,),

                Container(

                  width: double.infinity,
                  height: 200,


                  // decoration: BoxDecoration(
                  // color: Colors.purpleAccent,
                  // borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))

                  // ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("SingUp your account  ", style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w800),),
                  ),
                ),
                SizedBox( height: 5,),
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(5),


                  // decoration: BoxDecoration(
                  //     color: Colors.white,
                  //    // borderRadius: BorderRadius.circular(0),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           offset: Offset(0,5),
                  //           color: Colors.black.withOpacity(.2 ),
                  //           spreadRadius: 6,
                  //           blurRadius: 20
                  //       ),
                  //
                  //
                  //     ]
                  //
                  // ),


                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          child:   TextFormField(
                            controller: userNameControl,


                            keyboardType: TextInputType.text,

                            decoration: InputDecoration(
                                labelText: " UserName",

                                focusColor: Colors.black,
                                prefixIcon: Icon(Icons.person_2),
                                border: OutlineInputBorder(
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                        color: Colors.green
                                    )
                                )
                            ),
                            // validator: (UserName)=>UserName!.length<3?'place user more character':null,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,

                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          child:   TextFormField(
                            controller: emailcontrol,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "E-mail",
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.purpleAccent
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            validator: validemail,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          child:   TextFormField(
                            controller: Passwordcontrol,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock_open),
                                border: OutlineInputBorder(
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.purpleAccent
                                  ),
                                  borderRadius: BorderRadius.circular(28 ),
                                )),
                            validator: (Password)=>Password!.length<3?'Please use hard password':null,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          )
                      ),
                    ],
                  ),
                ),
                SizedBox( height: 20,),
                //
                Container(
                  height: 50,
                  width: 340,
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.green,foregroundColor: Colors.white,),
                      onPressed: (

                          ){
                        if(fromkey.currentState!=null && fromkey.currentState!.validate()) {
                          setState(() {
                            email = emailcontrol.text;
                            Password = Passwordcontrol.text;
                          });
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => Login(emial: email, password: Password),
                              ));
                          //
                          // QuickAlert.show(
                          //   context: context,
                          //   type: QuickAlertType.loading,
                          //   text: 'Singup was loading',
                          //
                          //   confirmBtnColor: Colors.purpleAccent,
                          // );



                        }
                        else if(userNameControl.text==null&&emailcontrol.text==null&&Passwordcontrol.text==null){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Make Sure you filled Information completely completely")));
                          //   return 'enter a number';
                          //   // QuickAlert.show(
                          //   //   context: context,
                          //   //   type: QuickAlertType.error,
                          //   //   title: 'Make Sure you filled Data completely ...',
                          //   //   text: 'Sorry, something went wrong',
                          //   //   confirmBtnColor: Colors.purpleAccent,
                          //   //
                          //   // );
                          //
                          //
                          //
                          //
                        }
                        else{

                          // QuickAlert.show(
                          //     context: context,
                          //     type: QuickAlertType.error,
                          //     title: 'Incorrect Data',
                          //     text: 'Please,Make Sure',
                          //     confirmBtnColor: Colors.purpleAccent
                          //
                          // );

                        }

                      },
                      child: Text(
                        "Sing Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
                      )),
                ),



              ],
            ),
          ),
        ),
      ),

    );
  }




}

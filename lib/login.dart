import 'package:flutter/material.dart';
import 'package:habittrackerapp/signup.dart';

import 'Homepage.dart';





class Login extends StatefulWidget {
  Login({super.key,   this.emial,   this.password});
  String? emial;
  String? password;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String?validemail(String?email){
    RegExp emailRegax=RegExp(r'@');
    final isEmailValid=emailRegax.hasMatch(email??'');
    if(!isEmailValid){
      return'please Enter a valid email';
    }
    return null;

  }
  TextEditingController emailcontrol =TextEditingController();
  TextEditingController Passcontrol =TextEditingController();

  final fromkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // print(username);
    // print(password);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,



      body: SingleChildScrollView(

        child: Form(
          key: fromkey,
          child: Column(

            children: [
              SizedBox(height: 30,),

              Container(
                width: double.infinity,
                height: 200,

                // decoration: BoxDecoration(
                //     color: Colors.purpleAccent,
                //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
                //
                // ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Login  ", style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w800),),
                ),
              ),

              // SizedBox(
              //   height: 5,
              // ),

              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(30),
                width: double.infinity,

                child:Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        child:   TextFormField(
                          controller: emailcontrol,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "E-MAIL",

                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),


                              )

                          ),

                          validator: validemail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,


                        )


                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        child:   TextFormField(
                          controller:Passcontrol ,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          validator: (Password)=>Password!.length<3?'place add more Numbers':null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        )



                    ),
                  ],
                ) ,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 340,
                padding: EdgeInsets.all(2),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: Colors.green,foregroundColor: Colors.white,),




                  onPressed: (){
                    if(fromkey.currentState!=null && fromkey.currentState!.validate()) {
                      if (emailcontrol.text == widget.emial && Passcontrol.text == widget.password) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(

                              builder: (context) => HomePage(),
                            ));
                        // // QuickAlert.show(
                        //   context: context,
                        //   type: QuickAlertType.success,
                        //   text: 'Login was Successfully!',
                        // );
                      }
                      else if(emailcontrol.text==widget.emial&&Passcontrol.text!=widget.password){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("please , Make sure the Password You Entered!!")));
                        // QuickAlert.show(
                        //     context: context,
                        //     type: QuickAlertType.error,
                        //     title: 'Password Mismatched!...',
                        //     text: 'please , Make sure the Password You Entered!!',
                        //     confirmBtnColor: Colors.purpleAccent
                        //
                        // );


                      }
                      else if(emailcontrol.text!=widget.emial&&Passcontrol.text==widget.password){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("please , check  the E-Mail  You Entered!!")));
                        // QuickAlert.show(
                        //     context: context,
                        //     type: QuickAlertType.error,
                        //     title: 'Invalid E-mail!...',
                        //     text: 'please , Make sure the E-mail You Entered!!',
                        //     confirmBtnColor: Colors.purpleAccent
                        //
                        // );

                      }
                      else if(emailcontrol.text!=widget.emial&&Passcontrol.text!=widget.password){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("please , Make sure the E-Mail and  Password You Entered!!")));
                        // QuickAlert.show(
                        //     context: context,
                        //     type: QuickAlertType.error,
                        //     title: 'Invalid E-mail and Password!...',
                        //     text: 'please , Make sure the E-mail and password You Entered!!',
                        //     confirmBtnColor: Colors.purpleAccent
                        //
                        // );
                      }

                    }



                  }, child: Text(
                  "Login",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                ),


                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   child:Text("Or ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              // ),




              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already I Don't have an Account?",
                    style: TextStyle(fontSize: 17),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingUp(),
                          ));
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(fontSize: 17,color: Colors.purpleAccent,fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              )
            ],
          ),
        ),


      ),
    );


  }
}

import 'package:celeto/Views/signupViews/signin_page.dart';
import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Container(
        width: screenWidth,
        decoration:  const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/movie_background.jpg'),
              fit: BoxFit.cover ),
        ),
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF2E4053),
                  Colors.black.withOpacity(0.5),
                  const Color(0xFFCD7F32).withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          child:Stack(
            alignment: Alignment.center,
              children:[
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 552,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.400)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(text: const TextSpan(
                              text: 'CEL',style: TextStyle(color: Color(0xFFCD7F32),fontSize: 50,fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: 'ETO',style: TextStyle(color: Color(0xFF63777E),fontSize: 50,fontWeight: FontWeight.bold),
                                )
                              ]
                          ),
                          ),
                          const SizedBox(height: 40,),
                          Row(
                            children: [
                              const Text('User Name',style: TextStyle(color: Color(0xFFCD7F32),fontSize: 30),)
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            color: Colors.transparent,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.text,
                              controller: _nameController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Enter Your Email Address',
                                hintStyle: const TextStyle(color: Colors.white),
                                // labelText: 'Email Address',labelStyle: TextStyle(color: Colors.yellow,fontSize: 30),
                                fillColor: Colors.transparent,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(width: 3, color: Color(0xFF2E4053)), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(40),

                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(width: 3, color: Colors.red), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                errorStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Color(0xFF2E4053)),
                                  borderRadius: BorderRadius.circular(40),
                                ),

                              ),
                              validator: (value){
                                if(value!.isEmpty || value == null){
                                  return 'Please Enter Name';
                                }
                              },
                            ),

                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              const Text('Email Address',style: TextStyle(color: Color(0xFFCD7F32),fontSize: 30),)
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            color: Colors.transparent,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Enter Your Email Address',
                                hintStyle: const TextStyle(color: Colors.white),
                                // labelText: 'Email Address',labelStyle: TextStyle(color: Colors.yellow,fontSize: 30),
                                fillColor: Colors.transparent,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(width: 3, color: Color(0xFF2E4053)), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(40),

                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(width: 3, color: Colors.red), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                errorStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Color(0xFF2E4053)),
                                  borderRadius: BorderRadius.circular(40),
                                ),

                              ),
                              validator: (value){
                                if(value!.isEmpty || value == null){
                                  return 'Please Enter email';
                                }
                              },
                            ),

                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              const Text('Password',style: TextStyle(color: Color(0xFFCD7F32),fontSize: 30),)
                            ],
                          ),
                          const SizedBox(height: 5,),

                          Container(
                            color: Colors.transparent,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              controller: _passwordController,
                              cursorColor: Colors.black,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                hintStyle: const TextStyle(color: Colors.white),
                                fillColor: Colors.transparent,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(width: 3, color: Color(0xFF2E4053)), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                errorStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(width: 3, color: Colors.red), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(40),

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Color(0xFF2E4053)),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty || value == null){
                                  return 'Please Enter password';
                                }
                              },

                            ),

                          ),
                          const SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_formKey.currentState!.validate()){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  const SigninPage()),
                                  );
                                }
                              });
                            },
                            child: Container(
                              width: 320,
                              height: 45,
                              decoration: BoxDecoration(
                                  color:  const Color(0xFF2E4053),
                                  border: Border.all(color: const Color(0xFF2E4053)),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: const Center(
                                child: Text(
                                  'Signup',style: TextStyle(color: Color(0xFFCD7F32),fontSize: 24),
                                ),
                              ),
                            ),
                          )


                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(onPressed: (){
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  const SigninPage()),
                          );

                        });
                      }, child: const Text('Signin',style:TextStyle(color: Color(0xFFCD7F32),fontSize: 24),))),
                )
              ]
          ),

        ),
      ),

    );
  }
}

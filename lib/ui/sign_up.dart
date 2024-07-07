

import 'package:flutter/material.dart';
import 'package:timbu_shop/ui/log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();

    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(currentFocus.hasPrimaryFocus
            && currentFocus.focusedChild != null){
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 10,
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black,),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Create Account", style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 10,),
                  const Text("Please Sign up to continue", style: TextStyle(
                      fontSize: 20, color: Colors.grey
                  ),),
                  const SizedBox(height: 40,),
                  TextFormField(
                    controller: _nameController,
                    style: const TextStyle(
                        color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Name",
                        prefixIcon: Icon(Icons.account_circle),
                        labelStyle: TextStyle(fontSize: 12)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(
                        color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "EMAIL",
                        prefixIcon: Icon(Icons.email_outlined),
                        labelStyle: TextStyle(fontSize: 12)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock_outlined),
                        labelStyle: const TextStyle(fontSize: 12)
                    ),
                  ),
                  const SizedBox(height: 10,),
            
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Comfirm Password",
                        prefixIcon: const Icon(Icons.lock_outlined),
                        labelStyle: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context)=> LogIn()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("SIGNUP"),
                            SizedBox(height: 5,),
                            Icon(Icons.arrow_forward, size: 24,)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?", style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 15
              ),),
              TextButton(onPressed: (){},
                  child: Text("Log in",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

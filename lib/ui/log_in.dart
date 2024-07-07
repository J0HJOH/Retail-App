

import 'package:flutter/material.dart';
import 'package:timbu_shop/ui/home_page.dart';
import 'package:timbu_shop/ui/sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Log In", style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 10,),
              const Text("Please Log in to continue", style: TextStyle(
                fontSize: 20, color: Colors.grey
              ),),
              const SizedBox(height: 40,),
              Expanded(
                child: TextFormField(
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
              ),
              const SizedBox(height: 5,),
              Expanded(
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.black,
                  ),
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outlined),
                  labelStyle: const TextStyle(fontSize: 12),
                    suffixIcon: TextButton(onPressed: () {},
                      child: const Text("FORGOT", style: TextStyle(
                        color: Colors.greenAccent,),
                      ),
                    )
                  ),
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
                          .push(MaterialPageRoute(builder: (context)=> HomePage()));
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
                        Text("LOGIN"),
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
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont have an account?", style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 15
              ),),
              TextButton(onPressed: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context)=> SignUp()));
              },
                  child: Text("Sign Up",
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

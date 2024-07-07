import 'package:flutter/material.dart';
import 'package:timbu_shop/ui/sign_up.dart';

import 'home_page.dart';
import 'log_in.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('woman_shopping.jpg'),
              fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.darken)
          )
        ),
        child:Column(children: [
          const Padding(padding: EdgeInsets.fromLTRB(5, 220, 5, 20)
          ),
          Image.asset('new_logo.png', height: 70, color: Colors.amberAccent,),
          const SizedBox(height: 100,),
          NewButton(onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignUp()));
          }, text: "SIGN UP",),
          const SizedBox(height: 50,),
          NewButton(onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LogIn()));
          }, text: "LOG IN",),
          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 30),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: ()=>Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage())
              ),
                  child: const Text("Skip",
                  style: TextStyle(color: Colors.amber,
                  fontWeight: FontWeight.w700,
                  fontSize: 30),)
              ),
            ),
          )

        ],)
      ),
    );


  }
}

class NewButton extends StatelessWidget {
  String text;
  final void Function() onPressed;

  NewButton({
    super.key, required this.onPressed, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          )
        ),
        child: Text( text,
        style: const TextStyle(
          fontSize: 22,
          color: Color.fromARGB(255, 94, 92, 92)
        ),),
      ),
    );
  }
}

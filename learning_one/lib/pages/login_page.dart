import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Text('Welcome Back',style: TextStyle(
                fontWeight: FontWeight.bold,
                color:Colors.white,
                fontSize: 24,
              ),),
              SizedBox(height:10),
              Text('Login',style:TextStyle(
                fontSize: 24,
                color:Colors.white
              )),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Username", border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    filled:true,
                    fillColor: Colors.white
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password", border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    filled:true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.visibility_off)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text('forgot password'))
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    print('login is click');
                  },
                  child: Text('Login')
              ),
              SizedBox(height: 15,),
              Text('or sign in with'), 
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){}, 
                    child: Image.asset(
                      'assets/images/google.jpeg',
                      width:50, 
                      height:50,
                      fit: BoxFit.contain,
                      )
                  ),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: Image.asset(
                      'assets/images/facebook.png',
                      width:50 ,
                      height:50,
                      fit: BoxFit.contain,
                      )
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?",
                    style: TextStyle(
                      color: Colors.white
                    ),),
                    SizedBox(width:4),
                    TextButton(onPressed: (){}, child: Text('Sign up',style: TextStyle(
                      color:Colors.yellow,
                      fontWeight: FontWeight.bold
                    ),))
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
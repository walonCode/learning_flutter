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
                color:Colors.white,
                fontWeight: FontWeight.bold
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
              Align(
                alignment: Alignment.centerRight,
                child: 
                  TextButton(
                    onPressed: () {}, 
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: Text('....forgot password',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),),
                  )
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      print('login is click');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                    ),
                    child: Text('Log in',style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ))
                ),
              ),
              SizedBox(height: 15,),
              Text('or sign in with',style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )), 
              SizedBox(height: 15,),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.jpeg',
                        width:25, 
                        height:25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8,),
                      Text('Google',style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                    ],
                  )
                ),
              ),
              SizedBox(height: 5,),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/facebook.png',
                        width:25 ,
                        height:25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width:8),
                      Text('Facebook',style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                    ],
                  )
                ),
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
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
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
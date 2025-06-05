import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drawer_widget/screens/login.dart';



class RollDiceScreen extends StatefulWidget {
  const RollDiceScreen({super.key});

  @override
  State<RollDiceScreen> createState() => _RollDiceScreenState();
}

// class _RollDiceScreenState extends State<RollDiceScreen>{
//
//
// }


class _RollDiceScreenState extends State<RollDiceScreen> {

  int diceNumber=1;

  //Method for handling the dice roll

  void rollDice(){
    setState(() {
      //skips the 0 and starts from one.
      diceNumber=Random().nextInt(5)+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          actions: [ // Add the menu icon to the right side (actions)
            // Builder( // Builder is still needed here to get a context for Scaffold.of
            //   builder: (context) {
            //     return IconButton(
            //       icon: const Icon(Icons.menu, color: Colors.white),
            //       onPressed: () {
            //         Scaffold.of(context).openDrawer();
            //       },
            //     );
            //   },
            // ),

          ],
        ),
        drawer: Drawer(
            child: Container(
                color: Colors.deepPurple[100],
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(accountName:Text("User"), accountEmail: Text("user@gmail.com"), currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://unsplash.com/photos/a-man-poses-in-a-stylish-red-outfit-XIMmHEnuq2g"),)),
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text("About"),
                        onTap: () {
                          Navigator.pop(context);
                        }
                    ),
                    ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Settings"),
                        onTap: () {
                          Navigator.pop(context);
                        }
                    ),
                    ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => LoginScreen(), // Go to RollDiceScreen
                          ),);
                        }
                    ),
                  ],



                )
            )
        ),
        body: SafeArea(child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Color(0xFF4A18C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
            ),
            child:Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('Let\'s play',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 30),

                    Image.asset(
                      'assets/images/dice-$diceNumber.png',
                      width:150,
                      height: 150,

                    ),
                    const SizedBox(height: 30),
                    //Button comes here

                    ElevatedButton(
                      onPressed: rollDice,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                          padding: EdgeInsets.symmetric(horizontal: 40,vertical:15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                      child: Text(
                        'Roll Dice',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                )
            )
        ),

        ));
  }
}

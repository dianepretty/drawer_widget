import 'package:drawer_widget/screens/roll_dice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController pwdcontroller=TextEditingController();
  String name="place holder";
  @override
  void dispose(){
    namecontroller.dispose();
    pwdcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Welcome", style:TextStyle(color:Colors.white,fontSize: 43,fontWeight:FontWeight.bold)),
          backgroundColor: Colors.indigo,
          toolbarHeight:100 ,
          centerTitle: true,
          // leading: Builder(
          //   builder: (context) {
          //     return IconButton(
          //       icon: const Icon(Icons.menu, color:Colors.white),
          //       onPressed: () {
          //         Scaffold.of(context).openDrawer();
          //       },
          //     );
          //   },
          // ),
        ),
        // drawer: Drawer(
        //   child: Container(
        //     color: Colors.deepPurple[100],
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       UserAccountsDrawerHeader(accountName:Text("User"), accountEmail: Text("user@gmail.com"), currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://unsplash.com/photos/a-man-poses-in-a-stylish-red-outfit-XIMmHEnuq2g"),)),
        //      // const  DrawerHeader(
        //      //      decoration: BoxDecoration(
        //      //        color: Colors.deepPurple
        //      //      ),
        //      //      child:
        //      //  Text("My drawer", style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold,color: Colors.black), )),
        //      //  ListTile(
        //      //    leading: Icon(Icons.home),
        //      //  title: Text("Home"),
        //      //    onTap: () {
        //      //    }
        //      //  ),
        //       ListTile(
        //           leading: Icon(Icons.person),
        //           title: Text("About"),
        //           onTap: () {
        //
        //               Navigator.pop(context);
        //
        //           }
        //       ),
        //       ListTile(
        //           leading: Icon(Icons.settings),
        //           title: Text("Settings"),
        //           onTap: () {
        //             Navigator.pop(context);
        //           }
        //       ),
        //     ],
        //
        //   )
        //   )
        // ),

        body: SafeArea(child: Column(

          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 0, 2),
                child: Text("User name", style:TextStyle(color:Colors.black,fontSize: 16,fontWeight:FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  hintText: "Enter user name",
                  border: OutlineInputBorder(), // This adds a default outline border
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 0, 2),
                child: Text("Password",style:TextStyle(color:Colors.black,fontSize: 16,fontWeight:FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller:pwdcontroller ,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  border: OutlineInputBorder(), // This adds a default outline border
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    padding:const EdgeInsets.symmetric(horizontal: 120,vertical: 20),
                    backgroundColor: Colors.indigo
                ),
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RollDiceScreen(), // Go to RollDiceScreen
                    ),
                  );
                  setState(() {
                    name=namecontroller.text;

                  });
                },
                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20),),

              ),
            ),


            // Text("Welcome $name")
          ],
        )
        )
    );
  }
}

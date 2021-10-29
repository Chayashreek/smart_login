import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_login/signup.dart';
import 'package:smart_login/temp.dart';
import 'package:smart_login/user_dialog.dart';
import 'package:smart_login/add_group.dart';
import 'package:smart_login/models/user.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'models/port.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFlutterList(),
      title: "Add device",
    );
  }
}

class MyFlutterList extends StatefulWidget {
  //const MyFlutterList({Key? key}) : super(key: key);

  @override
  _MyFlutterListState createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<MyFlutterList> {
  List<User> userList = [];
  List<Port> portList = [];

  final List<Widget> _children = [SettingsOnePage(), SignupPage()];


  int _index = 0;

  @override
  Widget build(BuildContext context) {
    void addUserData(User user) {
      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: AddUserDialog(addUserData),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      );
    }
    void addPortData(Port port) {
      setState(() {
        portList.add(port);
      });
    }
    void showPortDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: AddPortDialog(addPortData),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      );
    }

     _onTap(){
       Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context) => _children[_index]));
    }
//delete,longpress
    int selectedPage = 0;
    bool selected = true;
    return Scaffold(
        backgroundColor: Colors.white,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color(0XFF03989e),
        //   onPressed: showUserDialog,
        //   child: Icon(
        //     Icons.add,
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: Color(0XFF03989e),
          title: Text("KOKO BRICKS"),
        ),
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.95,
          child: ListView.builder(
            itemExtent: 290,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Card(
                    color: Color(0XFF8ed2c9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        (30),
                      ),
                    ),
                    margin: EdgeInsets.all(16),
                    elevation: 8,

                    child: new Column(
                      children: [Text(
                        userList[index].username,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        SizedBox(height: 15),
                        ButtonBar(

                          alignment: MainAxisAlignment.center,
                          buttonPadding: EdgeInsets.symmetric(
                              horizontal: 1, vertical: 6),
                          children: [

                            ElevatedButton(
                              child: Column(
                                children: [
                                  Text('All')
                                ],

                              ),
                              onPressed: () {}, style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(550)),
                              minimumSize: Size(240, 50),
                              primary: Color(0XFF03989e),

                            ),),
                            SizedBox(width: 15),

                          ],
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          buttonPadding: EdgeInsets.symmetric(
                              horizontal: 3, vertical: 6),
                          children: [
                            ElevatedButton(
                              child: Expanded(
                                child: Column(
                                  children: [
                                    IconButton(color: Colors.white,
                                      icon: Icon(selected ? Icons.add : Icons
                                          .check_circle_outline_sharp,
                                        color: Colors.white,),),
                                  ],),
                              ),
                              onPressed: () {
                                showPortDialog();
                                setState(() {
                                  selected = !selected;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(5),
                                //minimumSize: Size(140,30),
                                primary: Color(0XFF03989e),

                              ),),
                            SizedBox(width: 65),
                            ElevatedButton(
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Icon(Icons.add),
                                  ],),
                              ),
                              onPressed: () {}, style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(18),
                              //minimumSize: Size(140,30),
                              primary: Color(0XFF03989e),

                            ),),
                            SizedBox(width: 7),
                          ],
                        ),
                        SizedBox(height: 15),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          buttonPadding: EdgeInsets.symmetric(
                              horizontal: 3, vertical: 6),
                          children: [
                            // ElevatedButton(
                            //   child:Column(
                            //     children: [
                            //       Icon(Icons.add),
                            //       Text('Port 3')
                            //     ],
                            //   ),
                            //   onPressed: (){}, style: ElevatedButton.styleFrom(
                            //   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(65)),
                            //   minimumSize: Size(100,60),
                            //   primary: Color(0XFF03989e),
                            //Halcyon
                            // ),),
                            ElevatedButton(
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Icon(Icons.add),
                                  ],),
                              ),
                              onPressed: () {}, style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(18),
                              //minimumSize: Size(140,30),
                              primary: Color(0XFF03989e),

                            ),),
                            SizedBox(width: 65),
                            ElevatedButton(
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Icon(Icons.add),
                                  ],),
                              ),
                              onPressed: () {}, style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(18),
                              //minimumSize: Size(140,30),
                              primary: Color(0XFF03989e),

                            ),),
                            SizedBox(width: 7),
                          ],
                        ),
                      ],),
                  )
              );
            },
            itemCount: userList.length,
          ),
        ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        animationDuration: Duration(microseconds: 400),
        buttonBackgroundColor: Color(0XFF03989e),
        backgroundColor: Colors.white,
        color: Color(0XFF03989e),
        items: [
          Icon(Icons.home,size: 30,color: Colors.white),
          Icon(Icons.add,size: 30,color: Colors.white),
          Icon(Icons.settings,size: 30,color: Colors.white),
        ],
        onTap: (index){
          setState(() {
            if(index == 0){
              Navigator.push(context,
                  MaterialPageRoute(builder:(context) =>SettingsOnePage()));
            }else if(index == 1){
              showUserDialog();
              // Navigator.push(context,
              //     MaterialPageRoute(builder:(context) =>SettingsOnePage()));
            }else{
              Navigator.push(context,
                  MaterialPageRoute(builder:(context) =>SettingsOnePage()));
            }
          });
        },
      ),
        // bottomNavigationBar: Container(
        //   child: BottomNavyBar(
        //
        //
        //     backgroundColor: Color(0XFF03989e),
        //     onItemSelected: (index) => setState(()=>_index = index),
        //
        //     items: [
        //
        //       // BottomNavyBarItem(
        //       //   inactiveColor: Colors.white,
        //       //   icon: Icon(Icons.people),
        //       //   title: Text(''),
        //       //   activeColor: Colors.white,
        //       // ),
        //       // BottomNavyBarItem(
        //       //
        //       //   inactiveColor: Colors.white,
        //       //   icon: Icon(Icons.settings),
        //       //   activeColor: Colors.white,
        //       // ),
        //       // BottomNavyBarItem(
        //       //   inactiveColor: Colors.white,
        //       //   icon: Icon(Icons.settings),
        //       //   title: Text('Settings'),
        //       //   activeColor: Colors.white,
        //       // ),
        //     ],
        //
        //     }
        //   ),

//       bottomNavigationBar: BottomNavigationBar(
//
//         buttonBackgroundColor: Color(0XFF03989e),
//
//       height:50,
//       color: Color(0XFF03989e),
//
//       items :<Widget>[
//         //Icon(Icons.verified_user,size: 30,color: Colors.white),
//
//         IconButton(icon : Icon(Icons.verified_user)),
//         IconButton(icon : Icon(Icons.settings),onPressed:(){Navigator.of(context).push(MaterialPageRoute(builder:
//     (context) =>SettingsOnePage() ));},),
// ],
// //
// //
// //         // animationDuration: Duration(
// //         //   milliseconds:200
// //         // ),
// //         // animationCurve: Curves.bounceInOut,
// //         // onTap: (index){
// //         // setState(() {
// //         //   _index = index;
// //         // });
// //         // _onTap();
// //         // }
// //       ),
// // //

        // bottomNavigationBar: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 10,
        //   child: Container(
        //     height: 60,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               MaterialButton(
        //                   minWidth:40,
        //                   onPressed: (){
        //                     setState(() {
        //                       currentScreen = home();
        //                       currentTab =0;
        //                     });
        //                   }
        //                   child:Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //
        //       ))
        //             ],
        //           )
        //         ],
        //       ),
        //   ),
        // )




    );
  }
}





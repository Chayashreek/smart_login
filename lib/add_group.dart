import 'package:flutter/material.dart';
import 'package:smart_login/models/port.dart';

class AddPortDialog extends StatefulWidget {
  final Function(Port) addPort;
  AddPortDialog(this.addPort);

  // final Function(Group) addGroup;
  // AddGroupDialog(this.addGroup);

  @override
  _AddPortDialogState createState() => _AddPortDialogState();
}

class _AddPortDialogState extends State<AddPortDialog> {

  @override
  Widget build(BuildContext context) {

    Widget buildTextField(String hint,TextEditingController controller){
      return Container(
        margin:EdgeInsets.all(15),
        child:TextField(
          decoration:InputDecoration(
            labelText:hint,
            border:OutlineInputBorder(
              borderSide: BorderSide(
                color:Colors.black38,
              ),
            ),
          ),
          controller:controller,
        ),
      );
    }


    var portnameController = TextEditingController();
    var emailController = TextEditingController();
    //var usernameController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(8),
      height:300,
      width:400,
      child:SingleChildScrollView(
        child:Column(
          children: [
            Text('Add Port',style:TextStyle(
              fontWeight:FontWeight.bold,
              fontSize:32,
              color:Color(0XFF03989e),
            )),


            buildTextField('Device name', portnameController),
            buildTextField('Device id', emailController),

            ElevatedButton(onPressed:(){
              final port =Port(portnameController.text,emailController.text);
              widget.addPort(port);
              Navigator.of(context).pop();

            },
              child: Text('Add Port'),
              style:ElevatedButton.styleFrom(
                primary:Color(0XFF03989e),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

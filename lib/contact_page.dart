import 'package:flutter/material.dart';
class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}
 List<Map<String,dynamic>> users=[
   {'name':'Jawad',
    'phone':'01234567891'},
   {'name':'Ferdous',
     'phone':'01234567891'},
   {'name':'Hassan',
     'phone':'01234567891'},
   {'name':'Hassan',
     'phone':'01234567891'},
   {'name':'Hassan',
     'phone':'01234567891'},
   {'name':'Jawad',
     'phone':'01234567891'},
   {'name':'Ferdous',
     'phone':'01234567891'},
 ];
class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController phoneController=TextEditingController();
    final _formkey=GlobalKey<FormState>();
    return Scaffold(
      appBar:AppBar(
        title:Text('Contact List',style:TextStyle(
          fontWeight:FontWeight.bold,
          color:Color(0xffffffff),
          fontSize:32
        )),
        backgroundColor:Color(0xff4C7575),
        centerTitle:true,
      ),
      body:
      Column(
        children:[
          SizedBox(
            height:20
          ),
          Padding(
            padding:EdgeInsets.all(5),
            child: Form(
              key:_formkey,
              child:Column(
                children:[

                  TextFormField(
                    controller:nameController,
                    decoration:InputDecoration(
                      border:OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(10))
                      ),
                      hintText:'Enter Name',
                      hintStyle:TextStyle(
                        fontSize:20,
                      ),
                      helperText:'Persons Name',
                      helperStyle:TextStyle(
                        fontSize:17
                      ),
                      labelText:'Name'
                    ),
                    validator:(value){
                      if(value==null || value.isEmpty) return 'Enter a Name';
                      else if (value.length<2) return 'At least two digit' ;
                      else return null;
                      },
                  ),
                  SizedBox(
                    height:10,
                  ),
                  TextFormField(
                    controller:phoneController,
                    decoration:InputDecoration(
                      border:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(10))
                      ),
                      hintText:'Enter Phone Number',
                      hintStyle:TextStyle(
                        fontSize:20,
                      ),
                      helperText:'Number',
                      helperStyle:TextStyle(
                        fontSize:17,
                      ),
                      labelText:'Phone Number',
                      labelStyle:TextStyle(
                        fontSize:20,
                      )
                    ),
                    validator:(value){
                      if(value==null || value.isEmpty){
                        return 'Enter a Phone Number';
                      }
                      else if(value.length>11 || value.length<11){
                        return 'Length should be exact 11';
                      }
                      else{
                        return null;
                      }
                    }
                  ),
                  SizedBox(
                    height:6,
                  ),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor:Color(0xff4C7575),
                      minimumSize: Size(double.infinity, 45),
                    ),
                    onPressed:(){
                      if(_formkey.currentState!.validate());
                    },
                    child:Text('Add',style:TextStyle(
                        fontWeight:FontWeight.bold,
                        color:Color(0xffffffff),
                        fontSize:25
                    )),
                  )

                ]
              )
            ),),

          SizedBox(
            height:6,
          ),
          ///List will start form here
         Expanded(
             child:ListView.builder(
           itemCount:users.length,
           itemBuilder:(content,index){
             return
                 Card(child:ListTile(
                   title:Text(users[index]['name']),
                   subtitle:Text(users[index]['phone']),
                   leading:CircleAvatar(
                     //backgroundColor: Colors.deepOrangeAccent,
                       child:Icon(Icons.person)
                   ),
                   trailing:Icon(Icons.call,
                       color:Color(0xff19a9dd)),

                 ));
           }
         )
         )

        ]
      )
    );
  }
}

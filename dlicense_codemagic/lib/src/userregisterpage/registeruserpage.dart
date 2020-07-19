

import 'dart:convert';
//import 'model.dart';
//import 'package:api_to_sqlite_flutter/src/models/masterdata.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';


class Licencepage extends StatefulWidget {
  @override
  _Licencepage createState() => new _Licencepage();
  }
class _Licencepage extends State<Licencepage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 bool _autoValidate = false;
 String languageString;
  var dtOfBirth = new TextEditingController();  
//   var dtEcg = new TextEditingController(); 
//   var dtExam = new TextEditingController();  
//   var dtExpPrevcert = new TextEditingController(); 
//   var dtExpiryC1 = new TextEditingController();  
//   var dtExpiryC1Sp = new TextEditingController(); 
//   var dtExpiryC2 = new TextEditingController();  
//   var dtExpiryC3 = new TextEditingController();
//   var dtExpiryClapl = new TextEditingController();  
//   var dtIssue = new TextEditingController(); 
  bool visibilityclass1 = false;
 bool visibilityclass3=false;
  UserClass saveUserData = new UserClass();
  DateTime date;
  String niveaulevel=''; 
  int nilevel;
  String levelvalueanswer;
  String fromjsondata;
  
  final TextEditingController _controller = new TextEditingController();
  Future<void> _selectDate(BuildContext context,var a,TextEditingController datecontroller ) async {
      showDatePicker(
                     context: context,
                     initialDate: DateTime.now(),
                     firstDate: DateTime(1950),
                     lastDate: DateTime(2200)
                     ).then((date) {
                     setState(() {
                     datecontroller.text= a =date.toString();
                      //new DateFormat.yMMMMd().format(date);
                     }); }); 
  }

 String a;
 bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
      home: new Scaffold(
        
        appBar: new AppBar(
          
          title: new Text(' Register for DLicence'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              
              autovalidate: _autoValidate,
              
        
            child:  formUI(),
     
            ),
         
        ),
      ),
        ),
    );
  }
   Widget formUI() {
       return  Column(
      children:[
         new TextFormField(
          decoration: const InputDecoration(labelText: ' First Name'),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val)  =>saveUserData.firstName=val,
          ),
        new TextFormField(
          decoration: const InputDecoration(labelText: '  Last Name'),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val)  =>saveUserData.lastName=val,
          ),
        
        
        
          _nationality(),
        _placeOfBirth(),
        _dateOfBirth(),
        
        
        
        new TextFormField(
          decoration: const InputDecoration(labelText: ' Address '),
          keyboardType: TextInputType.text,
           validator: (value) => value == null ? 'field required' : null,
          onSaved: (String val)  =>saveUserData.address=val.toString(),
          ),
        
        
         _postalcode(),
        _city(),
       
        
          new TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val)  =>saveUserData.email=val.toString(),
        ),
           new TextFormField(
          decoration: const InputDecoration(labelText: 'Telephone'),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String val)  =>saveUserData.telephoneNumber=int.parse(val),
        ),
           CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('Are you a flite crew member '),
               controlAffinity: ListTileControlAffinity.leading,
              value: crewmember,
              onChanged: (bool value) { 
                setState(() =>crewmember= value);
             //   licenseDetail.copilot=ir;
              },  
        ),
// //           _contries(), 
//          _licenceNumber(),
//           _limitations(),
//          visibilityclass1 ? _dtExpiryC1Sp() : new Container(),
//          visibilityclass1 ? _dtExpiryC1() : new Container(),
//          visibilityclass1 ? _dtExpiryC2() : new Container(),
//          visibilityclass1 ? _dtExpiryClapl() : new Container(),
//          visibilityclass3 ? _dtExpiryC3() : new Container(),
//        //   _expirydateofthiscertificate(),
//          _dateOfInitialIssue(),
//            _examinationdate(),
//            _expirydateofpreviousMedicalCertificate(), 
//         _electrocardiogram(),
//            _audiogram(),
//           _comments(),
// //       
        showdata()
        
        
        
   
      ]
     );
     
   }
  //////////////////

  
//   Widget FormUI() {
//     return new Column(
//  /////////////////////
//       children: <Widget>[
//         new TextFormField(
//           decoration: const InputDecoration(labelText: 'Name'),
//           keyboardType: TextInputType.text,
//           validator: validateName,
//           onSaved: (String val) {
//             _name = val;
//           },
//         ),
//         new TextFormField(
//           decoration: const InputDecoration(labelText: 'Mobile'),
//           keyboardType: TextInputType.phone,
//           validator: validateMobile,
//           onSaved: (String val) {
//             _mobile = val;
//           },
//         ),
//         new TextFormField(
//           decoration: const InputDecoration(labelText: 'Email'),
//           keyboardType: TextInputType.emailAddress,
//           validator: validateEmail,
//           onSaved: (String val) {
//             _email = val;
//           },
//         ),
//         new SizedBox(
//           height: 10.0,
//         ),
//         new RaisedButton(
//           onPressed: _validateInputs,
//           child: new Text('Validate'),
//         )
//       ],
//     );
//   }


  ///////////////////////
   Widget _nationality() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' Nationality * ',
      hintText:'Select Nationality',
       ),
              value: nationality,
              onChanged: (String newValue) =>setState(() => nationality = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveUserData.nationality=val,
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['countryCode'].toString(),
            );
          }).toList(),
        );
     }  
//   //////////////////////
    Widget _placeOfBirth() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:'Place Of Birth * ',
      hintText:'Select Place Of Birth',
       ),
              value: placeOfBirth,
              onChanged: (String newValue) =>setState(() => placeOfBirth = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveUserData.placeOfBirth=val,
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['countryCode'].toString(),
            );
          }).toList(),
        );
     }  
//   //////////////////////
  //   //////////////////////
    Widget _postalcode() {
           return DropdownButtonFormField<String>(
      decoration: InputDecoration(
    labelText:'Postal Code * ',
      hintText:'Select Postal Code',
       ),
              value: postalcode,
              onChanged: (String newValue) =>setState(() => postalcode = newValue),
              validator: (value) => value == null ? 'field required' : null,
          //     onSaved: (val) =>  saveUserData..limitationId=int.parse(val),
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryPhone'].toString()),
              value: item['id'].toString(),
            );
          }).toList(),
        );}

     
    //   //////////////////////
    Widget _city() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' City * ',
      hintText:'Select City',
       ),
              value: city,
              onChanged: (String newValue) =>setState(() => city = newValue),
              validator: (value) => value == null ? 'field required' : null,
          // onSaved: (val) =>  saveUserData..=val,
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['countryCode'].toString(),
            );
          }).toList(),
        );
     }  
//     Widget _licenceNumber() { 
//       return TextFormField(
//           decoration: const InputDecoration(labelText: 'Certificate Number'),
//           keyboardType: TextInputType.phone,
//           validator: licenceNumber,
//           onSaved: (val) =>  saveMedicalData.licenseNumber=int.parse(val),
//         );
// }
  
  
//   ///////////////
//     Widget _limitations() { 
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//      labelText:'Limitations ',
//        //hintText:'Select LicenceCode',
//        ),
//               value: limitations,
//               onChanged: (String newValue) =>setState(() => limitations = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//                onSaved: (val) =>  saveMedicalData.limitationId=int.parse(val),
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryCode']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//         );}

//   /////////////
    Widget _dateOfBirth() {
     return TextFormField(
      controller: dtOfBirth,
      onTap : ()=>_selectDate(context,dateOfBirth,dtOfBirth),
  onSaved:(val) => saveUserData.dateOfBirth= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
       labelText:' Date of Birth *',
      hintText: ' $dateOfBirth',
      ),
    );
 }
  

//   //////////////
//      Widget _comments() { 
//       return TextFormField(
//            decoration: InputDecoration(  hintText: 'Enter  Comments Here',
//            labelText: 'Comments '),
      
//           onSaved: (val) =>  saveMedicalData.comments=val,
//         );
// }

  
  
  
  ///////////////
    
  Widget showdata(){
    return Row(children: <Widget>[
          Expanded(
            
              child: Container(
             
                height: 100,
              ),),
     RaisedButton(
       color:Colors.pink,
          onPressed:reset,
          child: new Text('Reset'),
          ),
         Container(
               width: 10,
               
              ),
  RaisedButton(
       color:Colors.indigo[400],
          onPressed: _validateInputs,
          child: new Text('Save'),
         
            ),
      
            ]
        );
  }
  ////////////////////////////////////////
  //validation
  ////////////////////////////
    String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  
  String licenceNumber(String value) {

  if(value == null) 
    return null;
 
  final n = num.tryParse(value);
  if(n == null) 
  return '"$value" is not a valid number';
 
  return null;
}
  
   bool isValidDob(String dat) {
    if (dat.isEmpty) return true;
     return false;
//  var d = convertToDate(dob);
 // return d != null && d.isBefore(new DateTime.now());
}




//   DateTime convertToDate(String input) {
//     try 
//     {
//       var d = new DateFormat.yMd().parseStrict(input);
//       return d;
//     } catch (e) {
//       return null;
//     }    
//   }
  
  /////////////////////////////////////////////////////////////////
  // All function
  /////////////////////////////////////////////////////////////////
//   getmedicaldata(){
    
//      user = welcomeFromJson(fromjsondata);
//  //   Map<String, dynamic> data = jsonDecode(fromjsondata);
//   print(  user.dtAudiogram);
//     electrocardiogram=user.dtAudiogram;
    
//   }
   void reset() {

   _formKey.currentState.reset();
     
}
  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    shoe(  saveUserData                 );

  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
  

  ///////////////////
  shoe(
 UserClass saveMedicalData){
// LicenseDetail licenseDetail,
//Personnel personal){
// saveLicenseData.personnel = <Personnel>[personal];
// saveLicenseData.licenseDetails = <LicenseDetail>[licenseDetail];
 String json = userClassToJson(saveMedicalData);
   fromjsondata= json;
 print( json);

}
  
  
  
        
 
  void _changed( String field) {
    switch(field){
   case "1": { visibilityclass1=true;  visibilityclass3=false;}
  break;
    case "2":{ visibilityclass3=true;  visibilityclass1=false;}
       break;
      
   default: { 
      visibilityclass1=false;
     visibilityclass3=false;
   }
   break; 
} 
       }
  bool crewmember=false;
  var city;
    var postalcode;
     var address;
    var dateOfBirth;
    var displayName;
    var email;
    var firstName;
    var id;
    var lastName;
    var nationality;
    var passportPhoto;
    var password;
    var placeOfBirth;
    var status;
    var telephoneNumber;

 ////////////////////////////////////////////////////////////////////////
}
///////////////























////////////////////////////////

var  jsonString={"comments":"gggh","dtAudiogram":"2020-07-18 00:00:00.000","dtEcg":"2020-07-14 00:00:00.000","dtExam":"2020-07-10 00:00:00.000","dtExpPrevcert":"2020-07-11 00:00:00.000","dtExpiryC1":null,"dtExpiryC1sp":null,"dtExpiryC2":null,"dtExpiryC3":null,"dtExpiryClapl":null,"dtIssue":"2020-07-11 00:00:00.000","id":null,"licenseId":1,"licenseNumber":234,"limitationId":2,"stateId":2};

  List<Map<String, dynamic>> countriesdatalist=[
  {
    "id": 1,
    "countryName": " AF",
    "countryCode": "Afghanistan",
    "countryPhone": 93
  },
  {
    "id": 2,
    "countryName": "AL",
    "countryCode": "Albania",
    "countryPhone": 355
  },
  {
    "id": 3,
    "countryName": "AG",
    "countryCode": "Algeria",
    "countryPhone": 213
  },
  
];






UserClass userClassFromJson(String str) => UserClass.fromJson(json.decode(str));

String userClassToJson(UserClass data) => json.encode(data.toJson());

class UserClass {
    UserClass({
        this.address,
        this.dateOfBirth,
        this.displayName,
        this.email,
        this.firstName,
        this.id,
        this.lastName,
        this.nationality,
        this.passportPhoto,
        this.password,
        this.placeOfBirth,
        this.status,
        this.telephoneNumber,
    });

    String address;
    String dateOfBirth;
    String displayName;
    String email;
    String firstName;
    String id;
    String lastName;
    String nationality;
    String passportPhoto;
    String password;
    String placeOfBirth;
    String status;
    int telephoneNumber;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        address: json["address"],
        dateOfBirth: json["dateOfBirth"],
        displayName: json["displayName"],
        email: json["email"],
        firstName: json["firstName"],
        id: json["id"],
        lastName: json["lastName"],
        nationality: json["nationality"],
        passportPhoto: json["passportPhoto"],
        password: json["password"],
        placeOfBirth: json["placeOfBirth"],
        status: json["status"],
        telephoneNumber: json["telephoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "dateOfBirth": dateOfBirth,
        "displayName": displayName,
        "email": email,
        "firstName": firstName,
        "id": id,
        "lastName": lastName,
        "nationality": nationality,
        "passportPhoto": passportPhoto,
        "password": password,
        "placeOfBirth": placeOfBirth,
        "status": status,
        "telephoneNumber": telephoneNumber,
    };
}







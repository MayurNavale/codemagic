import 'dart:convert';
import 'database_helper.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';

class Licencepage extends StatefulWidget {
  @override
  _Licencepage createState() => new _Licencepage();
  }
class _Licencepage extends State<Licencepage> {
                
                
            final TextEditingController _controller = new TextEditingController();
            Welcome saveLicenseData=new Welcome();
            LicenseDetail licenseDetail=new LicenseDetail(); 
            Personnel personal=new Personnel();
            final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
            List<int> _coldxfors = <int>[1,2,3,4,6];
            List<String> _color = <String>['rwerew','rewrew'];
            final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
            String a;
            bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Licence Detail'),
        ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                     _contries(), 
                     _licenceCodeOptions(),
            
          RaisedButton(
              child: Text( 'show', style: TextStyle(fontSize: 20), ),
              onPressed: () {
                a = 'd';
                shoe(  saveLicenseData,licenseDetail,personal);
              },
              ),
                   new Container(
            padding: const EdgeInsets.only(left: 40.0, top: 20.0),
            child: new RaisedButton(
              child: const Text('Submit'),
              onPressed: _submitForm,
            )),
             ],
       ))),
    );
  }
  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event
 shoe(  saveLicenseData,licenseDetail,personal);
      print('Form save called, newContact is now up to date...');
      print('Email: ${saveLicenseData.dt_validity}');
//       print('Dob: ${newContact.dob}');
//       print('Phone: ${newContact.phone}');
//       print('Email: ${newContact.email}');
//       print('Favorite Color: ${newContact.favoriteColor}');
//       print('========================================');
      print('Submitting to back end...');
      print('TODO - we will write the submission part next...');
    }
  }
    void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }
  
  
    Widget _contries() {
     return  FormField<String>(
  builder: (FormFieldState<String> state) {
    return InputDecorator(
      decoration: InputDecoration(
        //icon: const Icon(Icons.color_lens),
        labelText:'State of issue * ',
        hintText:'Select State',
        errorText: state.hasError ? state.errorText : null,
      ),
      isEmpty: countriesdatalist == [],
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value:  contries,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              contries= newValue;
              print(newValue);
               saveLicenseData.issuedBy = int.parse(newValue);
              state.didChange(newValue);
              print(saveLicenseData.issuedBy);
              
            });
          },
         
          items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['id'].toString(),
            );
          }).toList(),
        ),
      ),
    );
  },
  validator: (val) {
    return val != null? null : 'Please select State ';
  },
);
     
  }
 
  Widget _licenceCodeOptions() {
     return   new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
            controller: _controller,
            keyboardType: TextInputType.datetime,
            validator: (val) =>
                isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>saveLicenseData.dt_validity = convertToDate(val).toString(),
          )),
          new IconButton(
            icon: new Icon(Icons.more_horiz),
            tooltip: 'Choose date',
            onPressed: (() {
              _chooseDate(context, _controller.text);
            }),
          )
        ]);
  }
  bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
}


  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try 
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }    
  }
}



//          

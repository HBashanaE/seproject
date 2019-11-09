import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Login();
}

enum FormType { login, regiser }

class _Login extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

//There may be error here can't validate
  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if(_formType == FormType.login){
          AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        // print(user.user.uid);
        } else{
          AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
          // print(user.user.uid); 
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void moveToRegiter() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.regiser;
    });
  }
  void moveToLogin() {
    formKey.currentState.reset(); 
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login page'),
      ),
      body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value.isEmpty ? 'Email can\'t be empty' : null,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Password'),
                  validator: (value) =>
                      value.isEmpty ? 'Password can\'t be empty' : null,
                  onSaved: (value) => _password = value,
                  obscureText: true,
                ),
                new RaisedButton(
                  child: new Text('Login', style: TextStyle(fontSize: 20.0)),
                  onPressed: validateAndSubmit, 
                )
              ],
              // children: buildInputs() + buildSubmitButtons(),
            ),
          )),
    );
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
        obscureText: true,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if(_formType == FormType.login){
      return [
      new RaisedButton(
        child: new Text('Login', style: TextStyle(fontSize: 20.0)),
        onPressed: validateAndSubmit,
      ),
      new FlatButton(
        child: new Text(
          'Create an account',
          style: new TextStyle(fontSize: 20.0),
        ),
        onPressed: moveToRegiter,
      )
    ];
    }
    else{
      return [
      new RaisedButton(
        child: new Text('Create an account', style: TextStyle(fontSize: 20.0)),
        onPressed: validateAndSubmit,
      ),
      new FlatButton(
        child: new Text(
          'Already have an account?',
          style: new TextStyle(fontSize: 20.0),
        ),
        onPressed: moveToLogin,
      )
    ];
    }
    
  }
}

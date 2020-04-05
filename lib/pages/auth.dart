import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15.00),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Eamil', icon: Icon(Icons.email)),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    setState(() {
                      _emailValue = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password', icon: Icon(Icons.lock)),
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      _passwordValue = value;
                    });
                  },
                ),
                SwitchListTile(
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
                  title:
                      Text('      Accept Terms'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Text('Login'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

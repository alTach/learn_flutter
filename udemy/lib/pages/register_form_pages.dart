import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPages extends StatefulWidget {
  @override
  _RegisterFormPagesState createState() => _RegisterFormPagesState();
}

class _RegisterFormPagesState extends State<StatefulWidget> {
  bool hidePass = true;
  bool hideConfirmPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Register Form'),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Full name *',
                  hintText: 'What people call you?',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black87)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                labelText: 'Phone number',
                helperText: 'Phone format (xx) xxx - xx - xx',
                hintText: 'Where can we rich you?',
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black87)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email address *', icon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Live story',
                  hintText: 'Tell about yourself',
                  border: OutlineInputBorder()),
              maxLines: 3,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: "Enter the password",
                icon: Icon(Icons.security),
                suffixIcon: IconButton(icon: hidePass ? Icon(Icons.visibility) : Icon(Icons.visibility_off), onPressed: () {
                  setState(() {
                    this.hidePass = !this.hidePass;
                  });
                },),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: hideConfirmPass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                icon: Icon(Icons.border_color),
                suffixIcon: IconButton(icon: hideConfirmPass ? Icon(Icons.visibility) : Icon(Icons.visibility_off), onPressed: () {
                  setState(() {
                    this.hideConfirmPass = !this.hideConfirmPass;
                  });
                },),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Submit form',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)))
          ],
        ),
      ),
    );
  }
}

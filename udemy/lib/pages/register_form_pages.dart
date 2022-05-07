import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPages extends StatefulWidget {
  @override
  _RegisterFormPagesState createState() => _RegisterFormPagesState();
}

class _RegisterFormPagesState extends State<StatefulWidget> {
  bool hidePass = true;
  bool hideConfirmPass = true;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _liveController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _liveController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Register Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              validator: _validateName,
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
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly
                // FilteringTextInputFormatter(RegExp(r'[()\d-]{1,35}$'), allow: true)
              ],
              validator: (val) => _validatePhoneNumber(val) ? null : 'Phone number must be entered as (###)-###-####',
              decoration: InputDecoration(
                labelText: 'Phone number',
                helperText: 'Phone format (xxx)xxxx-xxxx',
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
            TextFormField(
              controller: _emailController,
              validator: _emailValidate,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email address *', icon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _liveController,
              decoration: InputDecoration(
                  labelText: 'Live story',
                  hintText: 'Tell about yourself',
                  border: OutlineInputBorder()),
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              maxLines: 3,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passController,
              obscureText: hidePass,
              maxLength: 8,
              validator: _validatePass,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: "Enter the password",
                icon: Icon(Icons.security),
                suffixIcon: IconButton(
                  icon: hidePass
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      this.hidePass = !this.hidePass;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confirmPassController,
              obscureText: hideConfirmPass,
              maxLength: 8,
              validator: _validatePass,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                icon: Icon(Icons.border_color),
                suffixIcon: IconButton(
                  icon: hideConfirmPass
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      this.hideConfirmPass = !this.hideConfirmPass;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: _submitForm,
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      print('Form is valid');
    } else {
      print('Form is not valid. Please review and correct');
    }
  }

  String? _validateName([String? value = '']) {
    final _nameExp = RegExp('r^[A-Za-z]');
    if (value!.isEmpty) {
      return 'Name is requred';
    } else if (_nameExp.hasMatch(value)) {
      return 'Please enter alfabetical characters';
    }
    return null;
  }

  bool _validatePhoneNumber([String? val = '']) {
    final _phoneRegExp = RegExp(r'^\(\d\d\d\)\d\d\d-\d\d\d\d$');
    return _phoneRegExp.hasMatch(val!);
  }

  String? _emailValidate([String? val = '']) {
    if (val!.isEmpty) {
      return 'Email is requred';
    } else if (!val.contains('@')) {
      return 'Email is not valid';
    }
    return null;
  }

  String? _validatePass([String? val = '']) {
    if (_passController.text.length < 8) {
      return 'Pass required 8 characters';
    } else if (_confirmPassController.text != _passController.text) {
      return 'Pass does\'t match';
    }
    return null;
  }
}

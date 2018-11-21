import 'package:car_pool/component/TextFormFieldBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  final VoidCallback onSubmit;
  final String SubmitText;
  final String ErrorMessage;
  final TextEditingController MemberNameController;
  final TextEditingController UsenameController;
  final TextEditingController PasswordController;

  const FormLogin(
      {Key key,
      this.MemberNameController,
      this.UsenameController,
      this.PasswordController,
      this.SubmitText = "",
      this.onSubmit,
      this.ErrorMessage = ""})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormLoginState(
        MemberNameController: MemberNameController,
        PasswordController: PasswordController,
        UsenameController: UsenameController,
        SubmitText: SubmitText,
        onSubmit: onSubmit,
        ErrorMessage: ErrorMessage);
  }
}

class FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final VoidCallback onSubmit;
  final String SubmitText;
  final String ErrorMessage;
  final TextEditingController MemberNameController;
  final TextEditingController UsenameController;
  final TextEditingController PasswordController;

  FormLoginState(
      {this.onSubmit,
      this.PasswordController,
      this.MemberNameController,
      this.UsenameController,
      this.SubmitText = "Submit",
      this.ErrorMessage = ""});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormFieldBox(
            controller: MemberNameController,
            labelText: "Member Code",
            validator: (String value) {
              return TextFormFieldBox.Required(value);
            },
          ),
          TextFormFieldBox(
            controller: UsenameController,
            labelText: "Username",
            validator: (String value) {
              return TextFormFieldBox.Required(value);
            },
          ),
          TextFormFieldBox(
            controller: PasswordController,
            labelText: "Password",
            MaxLength: 6,
            validator: (String value) {
              return TextFormFieldBox.Required(value);
            },
            ObscureText: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5.0),
                child: Text(
                  ErrorMessage == null ? "" : ErrorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              RaisedButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                shape: StadiumBorder(
                    side:
                        BorderSide(width: 2.0, color: Colors.deepOrangeAccent)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    onSubmit();
                  }
                },
                child: Text(SubmitText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

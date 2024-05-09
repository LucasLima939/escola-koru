import 'package:aula_03/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        centerTitle: true,
        title: Image.asset(
          AppAssets.logo,
          height: 31,
          width: 116,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _formField('Email'),
            const SizedBox(height: 16),
            _formField('Senha'),
          ],
        ),
      ),
    );
  }

  Widget _formField(String name) => Container(
        height: 64,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF333333),
        ),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              hintText: name,
              hintStyle: TextStyle(fontSize: 16, color: Color(0XFF828282)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      );
}

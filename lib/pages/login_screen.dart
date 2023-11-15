import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:belajar_app/navigationbar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _controlerLastName = TextEditingController();
  final TextEditingController _controlerFirstName = TextEditingController();

  String? email;

  void onSubmit() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate() || formKey.currentState != null) {
      setState(() {
        email = _controlerFirstName.text;
      });

      Navigator.of(context).push(
        MaterialPageRoute(builder: (builder) => const NavigationBarPage()),
      );

      _controlerFirstName.clear();
      _controlerLastName.clear();
    }
  }

  @override
  void dispose() {
    _controlerLastName.dispose();
    _controlerFirstName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "MyRecipe",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _controlerFirstName,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("First Name"),
                  hintText: 'Masukan First Name',
                ),
                validator: (value) {
                  if (value == null || value.length < 2) {
                    return 'Masukan First Name Dengan Benar';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controlerLastName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Last Name"),
                  hintText: 'Masukan Last Name',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    onSubmit();
                  } else {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.scale,
                      showCloseIcon: true,
                      title: 'Warning',
                      desc: 'Invalid First Name',
                      btnOkOnPress: () {},
                    ).show();
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

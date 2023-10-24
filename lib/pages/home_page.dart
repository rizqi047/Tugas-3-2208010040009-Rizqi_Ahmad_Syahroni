import 'package:belajar_app/pages/file_picker_page.dart';
import 'package:belajar_app/pages/image_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String nama = "Rizqi Ahmad Syahroni";
    var jurusan = "Application Software Engginering";
    var alamat = "Bengkulu Selatan";
    var umur = "20 tahun";
    var kampus = "LP3I YOGYAKARTA";
    var email = "rizqironi1@gmail.com";
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyApp"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 172, 29),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(3, 6),
                  blurRadius: 10,
                ),
              ],
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
            ),
            height: 500,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/tecnology.jpg"),
                          fit: BoxFit.fill),
                    ),
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(jurusan),
                  const SizedBox(height: 16),
                  Text(alamat),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Umur : "),
                      Text(umur),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Kampus : "),
                      Text(kampus),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Email : "),
                      Text(email),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => const FilePickerPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.login),
                    label: const Text("Login Picker"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => const ImagePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.login),
                    label: const Text("Login Image"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

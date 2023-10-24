import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerPage extends StatefulWidget {
  const FilePickerPage({super.key});

  @override
  State<FilePickerPage> createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  String selectedFilePath = "File tidak tersedia";
  DateTime? selectedDate;

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        selectedFilePath = file.name;
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2003),
        lastDate: DateTime(2030));

    if (pickDate != null) {
      setState(() {
        selectedDate = pickDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Picker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Selected File : $selectedFilePath",
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  selectFile();
                },
                child: const Text(
                  "Pick File",
                ),
              ),
              const SizedBox(height: 60),
              Text(
                "Selected Date : $selectedDate",
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  _selectDate();
                },
                child: const Text(
                  "Pick Date",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

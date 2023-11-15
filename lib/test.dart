// import 'package:flutter/material.dart';
// import 'package:form_app/screens/profile_screen.dart';

// class FormWidget extends StatefulWidget {
//   const FormWidget({super.key});

//   @override
//   State<FormWidget> createState() => _FormWidgetState();
// }

// class _FormWidgetState extends State<FormWidget> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController _controlerNama = TextEditingController();
//   final TextEditingController _controlerEmail = TextEditingController();
//   final TextEditingController _controlerTelepon = TextEditingController();

//   static const List<String> listHoby = ['Badminton', 'Futsal', 'Renang'];

//   String _value = '';

//   String? nama;
//   String? email;
//   String? telepon;
//   String? hobi;

//   String dropDownValue = listHoby.first;

//   void onSubmit() {
//     formKey.currentState!.save();
//     if (formKey.currentState!.validate() || formKey.currentState != null) {
//       setState(() {
//         nama = _controlerNama.text;
//         email = _controlerEmail.text;
//         telepon = _controlerTelepon.text;
//         hobi = dropDownValue;
//       });

//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (builder) => ProfilePage(
//             nama: '$nama',
//             email: '$email',
//             telepon: '$telepon',
//             hobi: hobi!,
//             jenisKelamin: _value,
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _controlerNama.dispose();
//     _controlerEmail.dispose();
//     _controlerTelepon.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Center(
//         child: Form(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _controlerNama,
//                 keyboardType: TextInputType.name,
//                 textInputAction: TextInputAction.next,
//                 decoration: const InputDecoration(
//                   label: Text("Nama Lengkap"),
//                   hintText: 'Masukan Nama Lengkap',
//                   icon: Icon(Icons.person),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.length < 2) {
//                     return 'Masukan Nama Dengan Benar';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _controlerEmail,
//                 keyboardType: TextInputType.emailAddress,
//                 textInputAction: TextInputAction.next,
//                 decoration: const InputDecoration(
//                   label: Text("Email"),
//                   hintText: 'Masukan Email',
//                   icon: Icon(Icons.email),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty || !value.contains('@')) {
//                     return 'Masukan Format Email Dengan Benar';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _controlerTelepon,
//                 keyboardType: TextInputType.number,
//                 textInputAction: TextInputAction.next,
//                 decoration: const InputDecoration(
//                   label: Text("Telepon"),
//                   hintText: 'Masukan No Telepon',
//                   icon: Icon(Icons.person),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.length < 11) {
//                     return 'Masukan Format Email Dengan Benar';
//                   }
//                   return null;
//                 },
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const Text("Pilih Hobi"),
//                   DropdownButton(
//                     value: dropDownValue,
//                     onChanged: (value) {
//                       setState(() {
//                         dropDownValue = value!;
//                       });
//                     },
//                     items:
//                         listHoby.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: RadioListTile(
//                       value: 'Perempuan',
//                       title: const Text("Perempuan"),
//                       groupValue: _value,
//                       onChanged: (value) {
//                         setState(() {
//                           _value = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile(
//                       value: 'Laki Laki',
//                       title: const Text("Laki Laki"),
//                       groupValue: _value,
//                       onChanged: (value) {
//                         setState(() {
//                           _value = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     onSubmit();
//                   }
//                 },
//                 icon: const Icon(Icons.login_sharp),
//                 label: const Text("Proses"),
//               ),
//               Text("Nama : $nama"),
//               Text("Email : $email"),
//               Text("Jenis Kelamin : $_value"),
//               Text("Telepon : $telepon"),
//               Text("Hobi : $hobi"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
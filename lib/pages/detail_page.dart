// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String namaBarang;
  String image;
  String fav;
  String deskripsi;
  String kondisi;
  DetailPage({
    Key? key,
    required this.namaBarang,
    required this.image,
    required this.fav,
    required this.deskripsi,
    required this.kondisi,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.namaBarang),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(widget.image),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.kondisi,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.fav.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.deskripsi,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ogrenciler_project/pages/mesajlar_sayfasi.dart';
import 'package:ogrenciler_project/pages/ogrenciler_sayfasi.dart';
import 'package:ogrenciler_project/pages/ogretmenler_sayfasi.dart';
import 'package:ogrenciler_project/repository/mesajlar_repository.dart';
import 'package:ogrenciler_project/repository/ogrenciler_repository.dart';
import 'package:ogrenciler_project/repository/ogretmenler_repository.dart';

void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(title: 'Öğrenci Ana Sayfa'),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  MesajlarRepository mesajlarRepository = MesajlarRepository();
  OgrencilerRepository ogrencilerRepository = OgrencilerRepository();
  OgretmenlerRepository ogretmenlerRepository = OgretmenlerRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Öğrenci",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "RobotMono",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              title: const Text("Öğrenciler"),
              onTap: () {
                _ogrencilereGit(context);
              },
            ),
            ListTile(
              title: const Text("Öğretmenler"),
              onTap: () {
                _ogretmenlereGit(context);
              },
            ),
            ListTile(
              title: const Text("Mesajlar"),
              onTap: () {
                _mesajlaraGit(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  _ogrencilereGit(context);
                },
                child:
                    Text("${ogrencilerRepository.ogrenciler.length} Öğrenci ")),
            TextButton(
                onPressed: () {
                  _ogretmenlereGit(context);
                },
                child: Text(
                    "${ogretmenlerRepository.ogretmenler.length} Öğretmen")),
            TextButton(
                onPressed: () {
                  _mesajlaraGit(context);
                },
                child:
                    Text("${mesajlarRepository.yeniMesajSayisi} yeni mesaj")),
          ],
        ),
      ),
    );
  }


  void _ogrencilereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return OgrencilerSayfasi(ogrencilerRepository);
    },));
  }

  void _ogretmenlereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return OgretmenlerSayfasi(ogretmenlerRepository);
    },));
  }

  Future<void> _mesajlaraGit(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MesajlarSayfasi(mesajlarRepository);
    },));
    setState(() {

    });
  }




}

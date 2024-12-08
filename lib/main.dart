import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gallery_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6200EE),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: const Color(0xFF6200EE),
              centerTitle: true,
              title: Text(
                'Home',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            endDrawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      'Ajeng Wakim',
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    accountEmail: const Text('ajengwakim08@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/foto1.jpg',
                          fit: BoxFit.cover,
                          width: 150,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF6200EE), Color(0xFFFFA8E7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.house, color: Color(0xFF6200EE)),
                    title: Text(
                      'Home',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading:const FaIcon(FontAwesomeIcons.images, color: Color(0xFF6200EE)),
                    title: Text('Galeri',style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GalleryPage())
                     ); 
                    },
                  ),
                  //
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFFFFA8E7)),
                    title: Text(
                      'Instagram',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      final Uri instagramUrl = Uri.parse(
                          'https://www.instagram.com/ajengwakim/profilecard/?igsh=MWllZXhtdncwanhmdQ==');
                      if (await canLaunch(instagramUrl.toString())) {
                        await launch(instagramUrl.toString());
                      } else {
                        throw 'Couldn\'t launch $instagramUrl';
                      }
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.whatsapp, color: Color(0xFF34A853)),
                    title: Text(
                      'WhatsApp', style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      final Uri url = Uri.parse('https://wa.me/081240865185?text=Hii');
                      if (await canLaunch(url.toString())) {
                        await launch(url.toString());
                      } else {
                        throw 'Couldn\'t launch $url';
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.rightFromBracket, color: Colors.red),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Logout'),
                            content: const Text('Yakin mau keluar?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Tidak'),
                              ),
                              TextButton(
                                onPressed: () {
                                  SystemNavigator.pop();
                                },
                                child: const Text(
                                  'Ya',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/foto3.jpg',
                        fit: BoxFit.cover,
                        width: 200,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Ajeng Wakim',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: 
                          Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Informatics Engineering Student',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF757575),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                                        Text(
                      'Skill Pada Microsoft Office',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Card(
                            color: const Color(0xFFF3E5F5),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const  Icon(Icons.slideshow, color: Color(0xFF6200EE), size: 40),
                                  const SizedBox(height: 10),
                                  Text(
                                    'PowerPoint',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color:const  Color(0xFF6200EE),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Menguasai pembuatan presentasi yang menarik dan profesional.',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color:const  Color(0xFF757575),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Card(
                            color:const  Color(0xFFE3F2FD),
                            elevation: 4,
                            child: Padding(
                              padding:const  EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const Icon (Icons.description, color: Color(0xFF0D47A1), size: 40),
                                  const SizedBox(height: 10),
                                  Text(
                                    'MS Word',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: const  Color(0xFF0D47A1),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Terampil dalam pengolahan dokumen, template, dan laporan.',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color:const  Color(0xFF757575),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Card(
                            color:const  Color(0xFFFFF9C4),
                            elevation: 4,
                            child: Padding(
                              padding:const  EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const Icon(Icons.table_chart, color: Color(0xFFF57F17), size: 40),
                                  const SizedBox(height: 10),
                                  Text(
                                    'MS Excel',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color:const  Color(0xFFF57F17),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Menguasai pengolahan data, formula, dan visualisasi data.',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color:const  Color(0xFF757575),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


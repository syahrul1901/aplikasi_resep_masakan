import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('About Us'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tentang Kami',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Aplikasi Resep Masakan adalah sebuah aplikasi yang menyediakan berbagai resep masakan yang dapat Anda coba di rumah. Kami memiliki koleksi resep masakan dari berbagai kategori, mulai dari hidangan pembuka, hidangan utama, hidangan penutup, camilan, hingga resep untuk diet khusus. Dengan Aplikasi Resep Masakan, Anda dapat menemukan inspirasi dan petunjuk untuk memasak makanan lezat sesuai dengan selera Anda.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Syahrul Yanuar - 2006088'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Bangkit Mujahidin - 2006087'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Abdul Mathin Tilmisani - 2006087'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hubungi Kami',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Jika Anda memiliki pertanyaan atau masukan mengenai Aplikasi Resep Masakan, jangan ragu untuk menghubungi kami melalui email atau telepon berikut:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: 2006088@itg.ac.id',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Telepon: +62 8123456789',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

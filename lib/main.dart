import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: JakaTarubPage(),
    );
  }
}

class JakaTarubPage extends StatefulWidget {
  @override
  _JakaTarubPageState createState() => _JakaTarubPageState();
}

class _JakaTarubPageState extends State<JakaTarubPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  String filePath = 'assets/audio/audio.mp3';
  double playbackSpeed = 1.0;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jaka Tarub Legend'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pada masa lalu hiduplah seorang pemuda bernama Jaka Tarub. Dia merupakan pemuda desa yang gemar berburu. Suatu hari, dia sedang berburu burung di tengah hutan.Selama seharian Jaka Tarub belum menemukan burung buruan. Dia masuk hutan semakin dalam. Di tengah belantara, sayup-sayup dia mendengar suara beberapa wanita sedang berbincang.Suara perempuan itu beradu dengan suara air gemericik. Karena penasaran, Jaka Tarub mencari sumber suara tersebut. Betapa terkejutnya dia saat melihat ternyata ada sekelompok bidadari yang tengah mandi di telaga. Paras para bidadari itu sangatlah cantik. Kemudian timbul sebuah ide nakal. Jaka Tarub mengambil salah satu baju milik bidadari itu. Kemudian dia kembali bersembunyi sambil membawa pakaian itu. Menjelang sore, para bidadari itu selesai mandi. Mereka mengenakan pakaian mereka kembali dan pulang menuju langit. Namun, ada satu bidadari yang tertinggal dan tidak ikut pulang. Sebab, dia kehilangan pakaiannya. Bak malaikat penolong, Jaka Tarub muncul meminjamkan kain kepada bidadari itu. Bidadari bernama Nawang Wulan itu lantas diajak pulang ke rumah. Mereka berdua kemudian menikah. Nawang Wulan kini juga harus bekerja seperti layaknya manusia, seperti memasak dan mencuci. Namun, sebagai seorang bidadari dia memiliki kesaktian. Setiap hari dia hanya memasukkan sehelai padi ke dalam periuk. Anehnya, hasilnya bisa menjadi nasi yang cukup dimakan sekeluarga.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await audioPlayer.setPlaybackRate(playbackSpeed);
                await audioPlayer.play(filePath, isLocal: true);
              },
              child: const Text('Play'),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.pause();
              },
              child: const Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.stop();
              },
              child: const Text('Stop'),
            ),
            const SizedBox(height: 20),
            Text(
              'Kecepatan Putar: ${playbackSpeed}x',
              style: const TextStyle(fontSize: 16),
            ),
            Slider(
              min: 1.0,
              max: 4.0,
              divisions: 3,
              value: playbackSpeed,
              onChanged: (value) {
                setState(() {
                  playbackSpeed = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
